import 'package:flutter/material.dart';
import 'detail.dart';
import 'recipe.dart';

class MealPlan {
  Map<String, Map<String, List<Recipe>>> meals = {
    "Monday": {"Breakfast": [], "Lunch": [], "Dinner": []},
    "Tuesday": {"Breakfast": [], "Lunch": [], "Dinner": []},
    "Wednesday": {"Breakfast": [], "Lunch": [], "Dinner": []},
    "Thursday": {"Breakfast": [], "Lunch": [], "Dinner": []},
    "Friday": {"Breakfast": [], "Lunch": [], "Dinner": []},
    "Saturday": {"Breakfast": [], "Lunch": [], "Dinner": []},
    "Sunday": {"Breakfast": [], "Lunch": [], "Dinner": []},
  };

  void addMeal(String day, String mealType, Recipe recipe) {
    meals[day]?[mealType]?.add(recipe);
  }

  // **Generate Grocery List**
  List<String> generateGroceryList() {
    Map<String, int> ingredientCounts = {};

    meals.forEach((day, mealTypes) {
      mealTypes.forEach((mealType, recipes) {
        for (var recipe in recipes) {
          for (var ingredient in recipe.ingredients) {
            if (ingredient.contains("optional")) {
              continue; // Skip this ingredient
            }
            String cleanedIngredient = ingredient.replaceAll(RegExp(r"\([^)]*\)"), "").trim();

            if (ingredientCounts.containsKey(cleanedIngredient)) {
              ingredientCounts[cleanedIngredient] = ingredientCounts[cleanedIngredient]! + 1;
            } else {
              ingredientCounts[cleanedIngredient] = 1;
            }
          }
        }
      });
    });

    // Sort the ingredients alphabetically and return the formatted list
    var sortedIngredients = ingredientCounts.entries
        .map((entry) => "${entry.value}x ${entry.key}")
        .toList();

    // Sort alphabetically by ingredient name (ignoring case)
    sortedIngredients.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    return sortedIngredients;
  }
}

class MealPlanScreen extends StatefulWidget {
  final MealPlan mealPlan;

  MealPlanScreen({Key? key, required this.mealPlan}) : super(key: key);

  @override
  MealPlanScreenState createState() => MealPlanScreenState();
}

class MealPlanScreenState extends State<MealPlanScreen> {
  // Add a method to clear all meals
  void clearMealPlan() {
    setState(() {
      widget.mealPlan.meals.forEach((day, mealTypes) {
        mealTypes.forEach((mealType, recipes) {
          recipes.clear();  // Clear all recipes for each meal type
        });
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("All recipes have been removed from the meal plan", style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> updatedGroceryList = widget.mealPlan.generateGroceryList();

    return Scaffold(
      backgroundColor: Color(0xFFF9D6E1),
      appBar: AppBar(
        title: Text("Meal Plan"),
        backgroundColor: Color(0xFFD0E1F9),
        actions: [
          ElevatedButton(
              onPressed: clearMealPlan,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                backgroundColor: Color.fromARGB(255, 200, 242, 236), // Button color
              ),
              child: Text("Refresh Meal Plan", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            ),
],  
      ),
      body: Column(
        children: [
          // Meal plan list
          Expanded(
            flex: 2,  // Give more space to the meal plan
            child: ListView(
              children: widget.mealPlan.meals.keys.map((day) {
                return Card(
                  margin: EdgeInsets.all(8),
                  color: Color(0xFFD3D3D3),
                  child: ExpansionTile(
                    title: Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    children: ["Breakfast", "Lunch", "Dinner"].map((mealType) {
                      final recipes = widget.mealPlan.meals[day]?[mealType] ?? []; // Get list of recipes
                      Color mealTextColor;
                      if (mealType == "Breakfast") {
                        mealTextColor = Colors.orange; // Example color for Breakfast
                      } else if (mealType == "Lunch") {
                        mealTextColor = Colors.green; // Example color for Lunch
                      } else {
                        mealTextColor = Colors.red; // Example color for Dinner
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(mealType, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: mealTextColor)),
                          ),
                          recipes.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text("No recipes added"),
                                )
                              : Column(
                                  children: recipes.map((recipe) {
                                    return ListTile(
                                      title: Text(recipe.name),
                                      leading: Image.asset(recipe.imageUrl, width: 50, height: 50, fit: BoxFit.cover,),
                                      onTap: () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                     builder: (context) => RecipeDetail(recipe: recipe, mealPlan: MealPlan(),),
                               ),
                              );
                               },
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            widget.mealPlan.meals[day]?[mealType]?.remove(recipe);
                                          });
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("${recipe.name} removed from $mealType on $day", style: TextStyle(color: Colors.black),), backgroundColor: Colors.white),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            ),
          ),

          // **Grocery List Section**
          Expanded(
            flex: 1,  // Give the grocery list less space than the meal plan
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grocery List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  updatedGroceryList.isEmpty
                      ? Center(child: Text("Your grocery list is empty!"))
                      : SingleChildScrollView(  // Added scroll view for grocery list
                          child: Column(
                            children: updatedGroceryList.map((item) {
                              return ListTile(
                                leading: Icon(Icons.check_box_outline_blank),
                                title: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
