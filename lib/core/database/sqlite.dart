// lib/core/database/database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase {
  // Single instance of the class (singleton)
  static final SqliteDatabase instance = SqliteDatabase._internal();

  // Private constructor for singleton pattern
  SqliteDatabase._internal();

  // Factory constructor to return the same instance
  factory SqliteDatabase() {
    return instance;
  }

  static Database? _database;

  // Initialize the database and open connection
  Future<void> initialize(List<String> queries) async {
    _database = await _initDatabase(queries);
  }

  // Get the database instance
  Database get database {
    assert(_database != null,
        "Database is not initialized. call initialize() first");
    return _database!;
  }

  // Private method to initialize the database
  Future<Database> _initDatabase(List<String> queries) async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'database.db');
    await deleteDatabase(path);
    return await openDatabase(
      path,
      version: 1,
      singleInstance: true,
      onCreate: (db, version) async {
        for (String sql in queries) {
          await db.execute(sql);
        }
        return;
      },
    );
  }
}
