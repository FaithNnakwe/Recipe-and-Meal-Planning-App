import 'package:flutter/material.dart';

import 'dbhelper.dart';

class UserProvider with ChangeNotifier {
  String? _username;
  int? _userId;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  String? get username => _username;
  int? get userId => _userId;
  bool get isLoggedIn => _username != null;

  Future<void> registerUser(
    String username,
    String email,
    String password,
  ) async {
    // Check if user already exists
    final existingUser = await _databaseHelper.getUserByEmail(email);
    if (existingUser != null) {
      throw Exception("Email already registered");
    }

    // Insert new user
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
      _userId = user[DatabaseHelper.columnId];
      notifyListeners();
    } else {
      throw Exception("Invalid email or password");
    }
  }

  void logout() {
    _username = null;
    _userId = null;
    notifyListeners();
  }

  // Add a favorite recipe for the logged-in user
  Future<void> addFavoriteRecipe(Map<String, dynamic> recipe) async {
    if (_userId != null) {
      await _databaseHelper.insertFavorite({
        ...recipe,
        DatabaseHelper.columnUserId: _userId,
      });
      notifyListeners();
    }
  }

  // Delete a favorite recipe for the logged-in user
  Future<void> deleteFavoriteRecipe(int recipeId) async {
    if (_userId != null) {
      await _databaseHelper.deleteFavorite(recipeId);
      notifyListeners();
    }
  }

  // Get favorite recipes for the logged-in user
  Future<List<Map<String, dynamic>>> getFavoriteRecipes() async {
    if (_userId != null) {
      return await _databaseHelper.getFavoriteRecipes(_userId!);
    }
    return [];
  }
}
