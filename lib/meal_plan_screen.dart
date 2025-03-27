import 'package:flutter/material.dart';
import 'meal_plan.dart';

class MealPlanScreen extends StatefulWidget {
  final MealPlan mealPlan;

  MealPlanScreen({required this.mealPlan});

  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Plan"), backgroundColor: Color(0xFFD0E1F9)),
      body: ListView(
        children: widget.mealPlan.meals.keys.map((day) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: ["Breakfast", "Lunch", "Dinner"].map((mealType) {
                final recipes = widget.mealPlan.meals[day]![mealType]!; // Get list of recipes

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(mealType, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                                leading: Image.asset(recipe.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      widget.mealPlan.meals[day]![mealType]!.remove(recipe);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("${recipe.name} removed from $mealType on $day")),
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
    );
  }
}

