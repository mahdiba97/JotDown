import 'package:jot_down/domain/model/note.dart';

abstract class LocalNoteRepository {
  Future<List<Note>> getNotes();

  Future<void> addNote(Note note);

  Future<void> addNotes(List<Note> notes);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(Note note);

  Future<void> deleteAllNotes();
}
