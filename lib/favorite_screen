import 'package:flutter/material.dart';
import 'recipe.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoritesScreen(this.favoriteRecipes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(title: Text("Favorite Recipes", style: TextStyle(color:Colors.black),), backgroundColor: Colors.lightBlueAccent,),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text("No favorite recipes yet!", style: TextStyle(color:Colors.black, fontSize: 20),))
          : ListView.separated(
              itemCount: favoriteRecipes.length,
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.white,
                  title: Text(favoriteRecipes[index].name,
                  style: TextStyle(color:Colors.black),),
                  leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                favoriteRecipes[index].imageUrl,
                width:50,
                height:50,
                fit: BoxFit.cover,
              ),
            ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: favoriteRecipes[index],
                          isFavorite: true,
                          onFavoriteToggle: (recipe) {},
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
