import 'package:flutter/material.dart';
import 'recipe.dart';
import 'meal_plan.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  final MealPlan mealPlan;

  RecipeDetail({required this.recipe, required this.mealPlan});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  String selectedDay = "Monday";  // Default to Monday
  String selectedMeal = "Breakfast";  // Default to Breakfast

  // Function to add recipe to meal plan
  void addToMealPlan() {
    widget.mealPlan.addMeal(selectedDay, selectedMeal, widget.recipe);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${widget.recipe.name} added to $selectedMeal on $selectedDay", style: TextStyle(color: Colors.black),),
       backgroundColor: Colors.white),
    );
    Navigator.pop(context); // Close dialog after adding the meal
  }

  // Function to show the dialog for adding to meal plan
  void showMealDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add to Meal Plan"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dropdown for selecting day of the week
              DropdownButton<String>(
                value: selectedDay,
                items: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
                    .map((day) => DropdownMenuItem(value: day, child: Text(day)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDay = value!;
                  });
                },
              ),
              // Dropdown for selecting meal type
              DropdownButton<String>(
                value: selectedMeal,
                items: ["Breakfast", "Lunch", "Dinner"]
                    .map((meal) => DropdownMenuItem(value: meal, child: Text(meal)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMeal = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            // Cancel action
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            // Add action
            ElevatedButton(onPressed: addToMealPlan, child: Text("Add")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E1F9),
      appBar: AppBar(
        title: Text(widget.recipe.name, style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFF9D6E1),
        actions: [
  TextButton(
    onPressed: showMealDialog,
    child: Text(
      'Add to Meal Plan',
      style: TextStyle(color: Colors.black),  // Adjust color as needed
    ),
  ),
],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.recipe.imageUrl),
              SizedBox(height: 30),
              Text("Ingredients:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...widget.recipe.ingredients.map((ingredient) => Text("- $ingredient")).toList(),
              SizedBox(height: 10),
              Text("Instructions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...widget.recipe.steps.map((step) => Text(step)).toList(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
