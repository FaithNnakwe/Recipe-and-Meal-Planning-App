import 'package:flutter/material.dart';
import 'detail.dart';
import 'recipe.dart';
import 'user_provider.dart';
import 'package:provider/provider.dart';

class MealPlan with ChangeNotifier {
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
     notifyListeners();
    
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
    final userProvider = Provider.of<UserProvider>(context);
    final mealPlan = userProvider.mealPlan;

    return Scaffold(
      backgroundColor: Color(0xFFF9D6E1),
      appBar: AppBar(
        title: Text("Meal Plan"),
        backgroundColor: Color(0xFFD0E1F9),
        actions: [
          ElevatedButton(
              onPressed: clearMealPlan,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                backgroundColor: Color(0xFFA8E6CF), // Button color
              ),
              child: Text("Refresh Meal Plan", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            ),
],  
      ),
      body: Column(
        children: [
          // Meal plan list
          Expanded(
            flex: 6,
            child: ListView(
              children: mealPlan.meals.keys.map((day) {
                return Card(
                  margin: EdgeInsets.all(8),
                  color: Color(0xFFD3D3D3),
                  child: ExpansionTile(
                    title: Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    children: ["Breakfast", "Lunch", "Dinner"].map((mealType) {
                      final recipes = mealPlan.meals[day]?[mealType] ?? []; // Get list of recipes
                      print("Recipes for $day - $mealType: ${recipes.map((r) => r.name).toList()}");
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
                                    // itemCount: recipes.length,
              //itemBuilder: (context, index) {
                //Recipe recipe = recipes[index];
                                    return ListTile(
                                      title: Text(recipe.name),
                                      leading: Image.asset(recipe.imageUrl, width: 50, height: 50, fit: BoxFit.cover,),
                                      onTap: () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                     builder: (context) => RecipeDetail(recipe: recipe, mealPlan: widget.mealPlan,)
                               ),
                              ).then((mealPlanUpdated) {
    if (mealPlanUpdated == true) {
      setState(() {});  // Only refresh if the meal plan was updated
    }
  });
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

          Expanded(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        ElevatedButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full-screen height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6, // Start at 60% height
          minChildSize: 0.2, // Can collapse down to 20%
          maxChildSize: 1.0, // Fully covers the screen when expanded
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8E8E8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Column(
                children: [
                  // Drag Handle
                  Container(
                    width: 40,
                    height: 6,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: updatedGroceryList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.check_box_outline_blank),
                          title: Text(updatedGroceryList[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFB3D9FF), // Background color (e.g., blue)
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Rounded corners
    ),
    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0), // Padding inside the button
  ),
  child: Text("View Grocery List", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
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
