import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  RecipeDetail({required this.recipe});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9D6E1) ,
      appBar: AppBar(title: Text(recipe.name, style: TextStyle(color: Colors.black),), backgroundColor: Color(0xFFD0E1F9),),
      body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(recipe.imageUrl),
              SizedBox(height: 30, width: 50,),
            Text("Ingredients:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...recipe.ingredients.map((ingredient) => Text("- $ingredient")).toList(),
            SizedBox(height: 10),
            Text("Instructions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...recipe.steps
                  .map((step) => Text(step))
                  .toList(),
            SizedBox(height: 20),
          ],
        ),
      ),
      )
    );
  }
}