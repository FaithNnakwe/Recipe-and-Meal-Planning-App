import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "FavoritesDatabase.db";
  static const _databaseVersion = 1;

  static const favoriteRecipesTable = 'favorite_recipes';
  static const usersTable = 'users';

  // Columns for favorite_recipes table
  static const columnId = '_id';
  static const columnTitle = 'title';
  static const columnIngredients = 'ingredients';
  static const columnInstructions = 'instructions';
  static const columnImageUrl = 'image_url';
  static const columnUserId = 'user_id'; // Foreign key reference to users

  // Columns for users table
  static const columnUserIdInUsers = 'user_id';
  static const columnUsername = 'username';
  static const columnEmail = 'email';
  static const columnPassword = 'password';

  Database? _db;

  static final DatabaseHelper instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return instance;
  }

  // Getter for database
  Future<Database> get database async {
    if (_db != null) return _db!;
    return await _initDatabase();
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    return _db!;
  }

  // Create tables
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $usersTable (
        $columnUserIdInUsers INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUsername TEXT NOT NULL UNIQUE,
        $columnEmail TEXT NOT NULL UNIQUE,
        $columnPassword TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $favoriteRecipesTable (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnIngredients TEXT NOT NULL,
        $columnInstructions TEXT NOT NULL,
        $columnImageUrl TEXT,
        $columnUserId INTEGER,
        FOREIGN KEY($columnUserId) REFERENCES $usersTable($columnUserIdInUsers) ON DELETE CASCADE
      )
    ''');
  }

  // Insert new user
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(usersTable, user);
  }

  // Get user by email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await database;
    final result = await db.query(
      usersTable,
      where: '$columnEmail = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Insert a favorite recipe (linking it to a user)
  Future<int> insertFavorite(Map<String, dynamic> recipe) async {
    final db = await database;
    return await db.insert(favoriteRecipesTable, recipe);
  }

  // Get favorite recipes by user
  Future<List<Map<String, dynamic>>> getFavoriteRecipes(int userId) async {
    final db = await database;
    return await db.query(
      favoriteRecipesTable,
      where: '$columnUserId = ?',
      whereArgs: [userId],
    );
  }

  // Delete favorite recipe by ID
  Future<int> deleteFavorite(int id) async {
    final db = await database;
    return await db.delete(
      favoriteRecipesTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
