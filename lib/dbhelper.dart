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

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _db;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  // Ensure a valid database instance
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
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

  // Get favorite recipes by user id
  Future<List<Map<String, dynamic>>> getFavoriteRecipes(int userId) async {
    final db = await database;
    return await db.query(
      favoriteRecipesTable,
      where: '$columnUserId = ?',
      whereArgs: [userId],
    );
  }

  // Delete favorite recipe by recipe id
  Future<int> deleteFavorite(String name) async {
    final db = await database;
    return await db.delete(
      favoriteRecipesTable,
      where: '$columnTitle = ?',
      whereArgs: [name],
    );
  }

  // Close the database to prevent memory leaks
  Future<void> closeDatabase() async {
    final db = _db;
    if (db != null) {
      await db.close();
      _db = null;
    }
  }
}
