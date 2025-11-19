import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteDB {
  static final FavoriteDB _instance = FavoriteDB._internal();
  factory FavoriteDB() => _instance;
  FavoriteDB._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY,
            name TEXT,
            language TEXT,
            genres TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<int> addFavorite(Map<String, dynamic> item) async {
    final client = await db;
    return client.insert('favorites', {
      "id": item["id"],
      "name": item["name"],
      "language": item["language"],
      "genres": item["genres"],
      "image": item["image"],
    });
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final client = await db;
    return client.query("favorites", orderBy: "id DESC");
  }

  Future<int> deleteFavorite(int id) async {
    final client = await db;
    return client.delete("favorites", where: "id = ?", whereArgs: [id]);
  }
}
