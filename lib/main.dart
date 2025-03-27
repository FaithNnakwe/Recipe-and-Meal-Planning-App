import 'package:flutter/material.dart';
import 'recipe.dart';
import 'detail.dart';
import 'meal_plan.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeList(),
    );
  }
}

class RecipeList extends StatefulWidget {
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
  int displayedRecipes = 6;

  @override
  Widget build(BuildContext context) {
    var filteredRecipes = recipes.where((recipe) {
      bool matchesFilters = selectedFilters.isEmpty || 
        (selectedFilters.contains('Vegan') && recipe.isVegan) ||
        (selectedFilters.contains('Gluten-Free') && recipe.isGlutenFree) ||
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
        title: Text('Recipe Finder'),
        actions: [
  TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MealPlanScreen(mealPlan: mealPlan)),
      );
    },
    child: Text(
      'View Meal Plan',
      style: TextStyle(color: Colors.black),  // Adjust color as needed
    ),
  ),
],
        backgroundColor: Color(0xFFF9D6E1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                FilterChip(
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
                    color: selectedFilters.isEmpty ? Colors.white : Colors.black,
                  ),
                ),
                ...filters.map((String filter) {
                  return FilterChip(
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
                      color: selectedFilters.contains(filter) ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by recipe name or ingredient...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: displayedRecipes < filteredRecipes.length ? displayedRecipes : filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail(recipe: recipe, mealPlan: mealPlan),
                      ),
                    );
                  },
                  child: Card(
                    color: Color(0xFFF9D6E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              recipe.imageUrl,
                              width: 60,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            recipe.name,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${recipe.ingredients.length} Ingredients',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 7)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (displayedRecipes < filteredRecipes.length)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    displayedRecipes += 6;
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text('Load More', style: TextStyle(color: Colors.white),),
              ),
            ),
        ],
      ),
    );
  }
}
