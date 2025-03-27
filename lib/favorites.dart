import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dbhelper.dart';
import 'user_provider.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes")),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Check if the user is logged in
          if (userProvider.isLoggedIn) {
            // Fetch the favorite recipes for the logged-in user
            return FutureBuilder<List<Map<String, dynamic>>>(
              future: userProvider.getFavoriteRecipes(),
              builder: (context, snapshot) {
                // Show a loading indicator while fetching data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                // If data is available, display the list of favorite recipes
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final recipe = snapshot.data![index];
                      return ListTile(
                        title: Text(recipe[DatabaseHelper.columnTitle]),
                        subtitle: Text(
                          recipe[DatabaseHelper.columnIngredients],
                        ),
                        leading:
                            recipe[DatabaseHelper.columnImageUrl] != null
                                ? Image.network(
                                  recipe[DatabaseHelper.columnImageUrl],
                                )
                                : null,
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Handle deletion of favorite recipe
                            userProvider.deleteFavoriteRecipe(
                              recipe[DatabaseHelper.columnId],
                            );
                          },
                        ),
                      );
                    },
                  );
                }

                // If no data or no favorites found
                return Center(child: Text("No favorite recipes found."));
              },
            );
          } else {
            // If the user is not logged in, show a message
            return Center(
              child: Text("Please log in to see your favorite recipes."),
            );
          }
        },
      ),
    );
  }
}
