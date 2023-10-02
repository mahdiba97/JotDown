import 'package:jot_down/domain/model/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<void> addNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(Note note);

  Future<void> deleteAllNotes();
}
