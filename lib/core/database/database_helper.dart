import 'package:creeartelo_challenge/models/event.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('events.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        lat REAL NOT NULL,
        long REAL NOT NULL,
        urlImage TEXT NOT NULL,
        category TEXT NOT NULL
      )
    ''');
  }

  Future<List<Event>> getEvents() async {
    final db = await instance.database;
    final result = await db.query('events');

    return result.map((e) => Event.fromMap(e)).toList();
  }

  Future<bool> saveFavorite(Event event) async {
    final db = await instance.database;
    try {
      await db.insert(
        'events',
        event.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteFavorite(int id) async {
    final db = await instance.database;
    try {
      await db.delete(
        'events',
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<int>> getFavoriteEventIds() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> results =
        await db.query('events', columns: ['id']);
    return results.map((row) => row['id'] as int).toList();
  }
}
