import 'package:flutter/foundation.dart';
import 'package:jot_down/framework/data/local/database/note_dao.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      debugPrint('_database is not null');
      return _database!;
    }
    debugPrint('_database is null');
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'noting.dp';
    final path = await getDatabasesPath();
    return "$path/$name";
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    debugPrint('_database path is $path');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    debugPrint('_database is created');
    return database;
  }

  Future<void> create(Database db, int version) async {
    debugPrint('_database table creation is called');
    await NoteDao().createTable(db);
    debugPrint('_database table creation is done');
  }
}
