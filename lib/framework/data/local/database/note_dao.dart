import 'package:jot_down/framework/data/local/database/database_helper.dart';
import 'package:jot_down/framework/data/local/model/local_note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDao {
  final tableName = 'notes';

  Future<void> createTable(Database db) async {
    await db.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
      "id" TEXT PRIMARY KEY NOT NULL,
      "isSynced" BOOLEAN NOT NULL,
      "isDeleted" BOOLEAN NOT NULL,
      "title" TEXT,
      "content" TEXT
      );""");
  }

  Future<void> insert(LocalNote note) async {
    final db = await DatabaseHelper().database;
    // Check if the note already exists in the database
    List<Map> result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [note.id],
    );

    // If the note exists and isSynced is true, skip the insertion
    if (result.isNotEmpty && result.first['isSynced'] == 1) {
      return;
    }

    // Otherwise, insert or replace the note
    await db.rawInsert(
        "INSERT INTO $tableName (id, title, content, isSynced, isDeleted) VALUES (?, ?, ?, ?, ?)",
        [note.id, note.title, note.content, note.isSynced, note.isDeleted]);
  }

  Future<List<LocalNote>> getNotes() async {
    final db = await DatabaseHelper().database;
    final result = await db.rawQuery("SELECT * FROM $tableName");
    return result.map((e) => LocalNote.fromMap(e)).toList();
  }

  Future<void> deleteAllNotes() async {
    final db = await DatabaseHelper().database;
    await db.rawDelete("DELETE FROM $tableName");
  }

  Future<void> deleteNote(LocalNote note) async {
    final db = await DatabaseHelper().database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> updateNote(LocalNote note) async {
    final db = await DatabaseHelper().database;
    await db
        .update(tableName, note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> addNotes(List<LocalNote> notes) async {
    final db = await DatabaseHelper().database;
    for (var element in notes) {
      db.insert(
        tableName,
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
