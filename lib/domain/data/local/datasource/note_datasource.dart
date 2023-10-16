import 'package:jot_down/domain/model/note.dart';

abstract class NoteDatasource {
  Future<List<Note>> getNotes();

  Future<void> addNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(Note note);

  Future<void> deleteAllNotes();

  Future<void> addNotes(List<Note> notes);
}
