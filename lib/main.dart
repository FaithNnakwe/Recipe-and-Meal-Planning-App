import 'package:flutter/material.dart';

import 'detail.dart';
import 'recipe.dart';

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
      home: DefaultTabController(length: 3, child: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;
  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'recipe_tabs';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    if (_tabController.index != tabIndex.value) {
      setState(() {
        _tabController.index = tabIndex.value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        return; // Prevents unnecessary rebuilds
      }
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          RecipeList(),
          Center(child: Text('Meal Plans Placeholder')),
          Center(child: Text('Favorites Placeholder')),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.restaurant_menu), text: 'Recipes'),
            Tab(icon: Icon(Icons.calendar_today), text: 'Meal Plans'),
            Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
          ],
        ),
      ),
    );
  }
}

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
