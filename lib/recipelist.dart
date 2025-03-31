import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail.dart';
import 'login.dart';
import 'recipe.dart';
import 'user_provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Recipe> myRecipes = recipes;
  List<String> filters = ['All', 'Vegan', 'Gluten-Free', 'Vegetarian'];
  String selectedFilter = 'All';
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

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
          if (selectedFilter != 'All') {
            switch (selectedFilter) {
              case 'Vegan':
                return recipe.isVegan;
              case 'Gluten-Free':
                return recipe.isGlutenFree;
              case 'Vegetarian':
                return recipe.isVegetarian;
              default:
                return true;
            }
          }
          return true;
        }).toList();

    if (searchQuery.isNotEmpty) {
      filteredRecipes =
          filteredRecipes
              .where(
                (recipe) => recipe.name.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
              )
              .toList();
    }

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
                children:
                    filters.map((String filter) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: FilterChip(
                          label: Text(filter),
                          selected: selectedFilter == filter,
                          onSelected: (bool selected) {
                            setState(
                              () => selectedFilter = selected ? filter : 'All',
                            );
                          },
                          selectedColor: Colors.blueAccent,
                          backgroundColor: Color(0xFFF5E6C4),
                          labelStyle: TextStyle(
                            color:
                                selectedFilter == filter
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
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
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return _buildRecipeCard(context, recipe, userProvider);
              },
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
          MaterialPageRoute(builder: (context) => RecipeDetail(recipe: recipe)),
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

              // Favorites Button
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
                            // Navigate to the Login screen
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${recipe.name} removed from favorites',
                          ),
                        ),
                      );
                    } else {
                      await userProvider.addFavoriteRecipe(recipe.toMap());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${recipe.name} added to favorites'),
                        ),
                      );
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
