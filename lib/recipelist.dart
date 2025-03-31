import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail.dart';
import 'login.dart';
import 'meal_plan.dart';
import 'recipe.dart';
import 'user_provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Recipe> myRecipes = recipes;
  MealPlan mealPlan = MealPlan();
  List<String> filters = ['Vegan', 'Gluten-Free', 'Vegetarian'];
  Set<String> selectedFilters = {'Vegan', 'Gluten-Free', 'Vegetarian'};
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  int displayedRecipes = 6; // Initial number of recipes displayed

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    var filteredRecipes =
        recipes.where((recipe) {
          bool matchesFilters =
              selectedFilters.isEmpty ||
              (selectedFilters.contains('Vegan') && recipe.isVegan) ||
              (selectedFilters.contains('Gluten-Free') &&
                  recipe.isGlutenFree) ||
              (selectedFilters.contains('Vegetarian') && recipe.isVegetarian);

          String query = searchQuery.toLowerCase();
          bool matchesName = recipe.name.toLowerCase().contains(query);
          bool matchesIngredient = recipe.ingredients.any(
            (ingredient) => ingredient.toLowerCase().contains(query),
          );

          return matchesFilters && (matchesName || matchesIngredient);
        }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFD0E1F9),
      appBar: AppBar(
        title: Text('Recipe List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for recipes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (query) {
                setState(() => searchQuery = query);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                      label: Text('Clear All'),
                      selected: selectedFilters.isEmpty,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selectedFilters.isNotEmpty) {
                            selectedFilters.clear();
                          } else {
                            selectedFilters.addAll(filters);
                          }
                        });
                      },
                      selectedColor: Colors.redAccent,
                      backgroundColor: Color(0xFFF5E6C4),
                      labelStyle: TextStyle(
                        color:
                            selectedFilters.isEmpty
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                  ...filters.map((String filter) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: FilterChip(
                        label: Text(filter),
                        selected: selectedFilters.contains(filter),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedFilters.add(filter);
                            } else {
                              selectedFilters.remove(filter);
                            }
                          });
                        },
                        selectedColor: Colors.blueAccent,
                        backgroundColor: Color(0xFFF5E6C4),
                        labelStyle: TextStyle(
                          color:
                              selectedFilters.contains(filter)
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: displayedRecipes.clamp(0, filteredRecipes.length),
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return _buildRecipeCard(context, recipe, userProvider);
              },
            ),
          ),
          if (displayedRecipes < filteredRecipes.length)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    displayedRecipes += 6; // Load 6 more recipes each time
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB3D9FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                ),
                child: Text(
                  'Load More',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(
    BuildContext context,
    Recipe recipe,
    UserProvider userProvider,
  ) {
    bool isFavorite = userProvider.favoriteRecipes.any(
      (fav) => fav['title'] == recipe.name,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => RecipeDetail(recipe: recipe, mealPlan: mealPlan),
          ),
        );
      },
      child: Card(
        color: Color(0xFFF9D6E1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    recipe.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                recipe.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                '${recipe.ingredients.length} Ingredients',
                style: TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              if (!userProvider.isLoggedIn)
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please log in to add favorites'),
                        action: SnackBarAction(
                          label: 'Log In',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                )
              else
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isFavorite ? Colors.red : Colors.black54,
                  ),
                  onPressed: () async {
                    if (isFavorite) {
                      await userProvider.deleteFavoriteRecipe(recipe.name);
                    } else {
                      await userProvider.addFavoriteRecipe(recipe.toMap());
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
