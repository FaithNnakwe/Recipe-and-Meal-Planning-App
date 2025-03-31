import 'package:flutter/material.dart';
import 'package:meal_planning_app/meal_plan.dart';
import 'package:provider/provider.dart';

import 'detail.dart';
import 'main.dart';
import 'recipe.dart';
import 'user_provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E1F9),
      appBar: AppBar(title: const Text("Favorite Recipes"), backgroundColor: Color(0xFFF9D6E1),),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (!userProvider.isLoggedIn) {
            return const Center(
              child: Text("Please log in to see your favorite recipes."),
            );
          }

          final favoriteRecipes = userProvider.favoriteRecipes;


          if (favoriteRecipes.isEmpty) {
            return const Center(child: Text("No favorite recipes found."));
          }

          // Add this check to prevent zero size issues
          if (MediaQuery.of(context).size.width == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: favoriteRecipes.length,
            itemBuilder: (context, index) {
              final recipe = favoriteRecipes[index];

              // Make sure we're handling null or empty strings
              String ingredientsText = '';
              if (recipe['ingredients'] != null) {
                // Check if ingredients is a List and convert it to a string
                if (recipe['ingredients'] is List) {
                  ingredientsText = (recipe['ingredients'] as List).join(', ');
                } else {
                  ingredientsText = recipe['ingredients'].toString();
                }
              }

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => RecipeDetail(
                            recipe: Recipe.fromMap(recipe),
                            mealPlan: MealPlan(),
                          ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Displaying the image
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(recipe['image_url'] ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              recipe['title'] ?? 'No Title',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              'Ingredients: $ingredientsText',
                              style: const TextStyle(fontSize: 14),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      // Delete icon positioned in the top-right corner
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () async {
                              // Delete this favorite recipe
                              await userProvider.deleteFavoriteRecipe(
                                recipe['title'],
                              );
                              // Show a confirmation message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${recipe['title']} removed from favorites',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      // Add a floating action button to navigate back to recipes
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Login screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false,
          );
        },
        backgroundColor: Colors.blueAccent,
        tooltip: 'Add more recipes',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
