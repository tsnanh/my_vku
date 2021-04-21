import 'dart:io' as io;

import 'package:myvku/models/news.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE News (cmsId TEXT PRIMARY KEY, categoryName TEXT, title TEXT, content TEXT, createdDate TEXT, updatedDate TEXT, slug TEXT, attachment TEXT)");
    await db.execute(
        "CREATE TABLE Absence (className TEXT PRIMARY KEY, title TEXT, firstName TEXT, lastName TEXT, date TEXT)");
    await db.execute(
        "CREATE TABLE MakeupClass (className TEXT PRIMARY KEY, title TEXT, firstName TEXT, lastName TEXT, dateMakeup TEXT, room TEXT)");
    print("Created tables");
  }

  Future<List<News>> getNews() async {
    final database = await db;
    final objects = await database.query('News', orderBy: 'updatedDate');
    print(objects);
    return objects.map((e) => News.fromJson(e)).toList();
  }

  insertAllNews(List<News> news) async {
    final database = await db;
    news.forEach((element) {
      database.insert(
        'News',
        element.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }
}
