import 'package:flutter/material.dart';
import 'package:meal_planning_app/favorites.dart';
import 'package:provider/provider.dart';

import 'dbhelper.dart';
import 'login.dart';
import 'recipelist.dart';
import 'user_provider.dart';

final dbHelper = DatabaseHelper();

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

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
  const HomeScreen({super.key});

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
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the Login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                  radius: 25,
                ),
              ),
            ),
            Column(
              children: [
                Text('Recipe Finder'),
                user.isLoggedIn
                    ? Text(
                      'Welcome, ${user.username}!',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    )
                    : Text(''),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RecipeList(),
          Center(child: Text('Meal Plans Placeholder')),
          Favorites(),
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
