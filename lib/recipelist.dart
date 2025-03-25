import 'package:flutter/material.dart';

import 'detail.dart';
import 'recipe.dart';

class RecipeList extends StatefulWidget {
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
    var filteredRecipes = recipes;

    if (selectedFilter != 'All') {
      filteredRecipes =
          recipes.where((recipe) {
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
          }).toList();
    }

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
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
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children:
                    filters.map((String filter) {
                      return FilterChip(
                        label: Text(filter),
                        selected: selectedFilter == filter,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedFilter = selected ? filter : 'All';
                          });
                        },
                        selectedColor: Colors.blueAccent,
                        backgroundColor: Color(0xFFF5E6C4),
                        labelStyle: TextStyle(
                          color:
                              selectedFilter == filter
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      );
                    }).toList(),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Prevents nested scrolling
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetail(recipe: recipe),
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
                          const SizedBox(height: 3),
                          Text(
                            recipe.name,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${recipe.ingredients.length} Ingredients',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 7),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
