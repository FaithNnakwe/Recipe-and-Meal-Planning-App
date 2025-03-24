import 'package:flutter/material.dart';
import 'recipe.dart';
import 'detail.dart';

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
  // Sample recipe list
  List<Recipe> myRecipes = recipes;

  List<String> filters = ['All', 'Vegan', 'Gluten-Free', 'Vegetarian'];
  String selectedFilter = 'All';

  // Search functionality
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    var filteredRecipes = recipes;

    // Filter recipes based on selected filter
    // Apply multiple filters
if (selectedFilter == 'Vegan') {
    filteredRecipes = recipes.where((recipe) => recipe.isVegan).toList();
  } else if (selectedFilter == 'Gluten-Free') {
    filteredRecipes = recipes.where((recipe) => recipe.isGlutenFree).toList();
  } else if (selectedFilter == 'Vegetarian') {
    filteredRecipes = recipes.where((recipe) => recipe.isVegetarian).toList();
  }

  // Apply search filter by recipe name
    if (searchQuery.isNotEmpty) {
      filteredRecipes = filteredRecipes.where((recipe) =>
          recipe.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }


    return Scaffold(
  backgroundColor: Color(0xFFD0E1F9),
  appBar: AppBar(
    title: Text('Recipe Finder'),
    backgroundColor: Colors.transparent,
    elevation: 0,
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
  body: Column(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0,
          children: filters.map((String filter) {
            return FilterChip(
              label: Text(filter,),
              selected: selectedFilter == filter,
              onSelected: (bool selected) {
                setState(() {
                    selectedFilter = selected ? filter : 'All'; // Update selected filter
                  });
              },
              selectedColor: Colors.blueAccent,
              backgroundColor: Color(0xFFF5E6C4),
              labelStyle: TextStyle(
                color: selectedFilter == filter ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
      ),
      Expanded(
        child: GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7, // Adjust height of grid items
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
    ],
  ),
);
  }
}