import 'package:flutter/material.dart';

import 'dbhelper.dart';

class UserProvider with ChangeNotifier {
  String? _username;
  int? _userId;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> _favoriteRecipes = [];

  String? get username => _username;
  int? get userId => _userId;
  bool get isLoggedIn => _username != null;
  List<Map<String, dynamic>> get favoriteRecipes => _favoriteRecipes;

  Future<void> registerUser(
    String username,
    String email,
    String password,
  ) async {
    final existingUser = await _databaseHelper.getUserByEmail(email);
    if (existingUser != null) {
      throw Exception("Email already registered");
    }

    await _databaseHelper.insertUser({
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnPassword: password, // Ideally, hash the password
    });
  }

  Future<void> login(String email, String password) async {
    final user = await _databaseHelper.getUserByEmail(email);
    if (user != null && user[DatabaseHelper.columnPassword] == password) {
      _username = user[DatabaseHelper.columnUsername];
      _userId = user[DatabaseHelper.columnUserIdInUsers]; // Ensure correct ID
      await _loadFavoriteRecipes(); // Load favorites upon login
      notifyListeners();
    } else {
      throw Exception("Invalid email or password");
    }
  }

  void logout() {
    _username = null;
    _userId = null;
    _favoriteRecipes = []; // Clear favorites on logout
    notifyListeners();
  }

  Future<void> _loadFavoriteRecipes() async {
    if (_userId != null) {
      _favoriteRecipes = await _databaseHelper.getFavoriteRecipes(_userId!);
      notifyListeners();
    }
  }

  // Add a favorite recipe for the logged-in user
  Future<void> addFavoriteRecipe(Map<String, dynamic> recipe) async {
    if (_userId != null) {
      // Ensure recipe title and user_id are valid
      if (recipe['name'] == null || _userId == null) {
        print("Error: Missing necessary recipe data or user ID.");
        return;
      }

      // Check if the recipe is already in the favorites list
      bool isAlreadyFavorite = _favoriteRecipes.any(
        (fav) => fav[DatabaseHelper.columnTitle] == recipe['name'],
      );

      if (isAlreadyFavorite) {
        print('${recipe['name']} is already in your favorites.');
        return; // Exit without adding the duplicate
      }

      // Convert ingredients list to a string
      String ingredients = recipe['ingredients']?.join(', ') ?? '';

      // Ensure instructions is not null, provide a default if missing
      String instructions = recipe['instructions'] ?? '';

      // Prepare the recipe data for insertion into the database
      Map<String, dynamic> recipeData = {
        DatabaseHelper.columnTitle: recipe['name'],
        DatabaseHelper.columnIngredients: ingredients,
        DatabaseHelper.columnInstructions: instructions,
        DatabaseHelper.columnImageUrl: recipe['imageUrl'],
        DatabaseHelper.columnUserId: _userId, // Ensure user_id is an integer
      };

      // Insert the recipe into the database
      await _databaseHelper.insertFavorite(recipeData);
      await _loadFavoriteRecipes(); // Refresh the favorite recipes list
      notifyListeners();
    }
  }

  // Delete a favorite recipe for the logged-in user
  Future<void> deleteFavoriteRecipe(String recipeName) async {
    if (_userId != null) {
      await _databaseHelper.deleteFavorite(recipeName);
      await _loadFavoriteRecipes(); // Refresh list after deleting
      notifyListeners();
    }
  }
}
