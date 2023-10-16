import 'package:jot_down/domain/data/local/datasource/note_datasource.dart';
import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';

class NoteRepositoryImpl extends LocalNoteRepository {
  NoteDatasource datasource;

  NoteRepositoryImpl({required this.datasource});

  @override
  Future<void> addNote(Note note) async {
    datasource.addNote(note);
  }

  @override
  Future<void> deleteAllNotes() async {
    datasource.deleteAllNotes();
  }

  @override
  Future<void> deleteNote(Note note) async {
    datasource.deleteNote(note);
  }

  @override
  Future<List<Note>> getNotes() async {
    return datasource.getNotes();
  }

  @override
  Future<void> updateNote(Note note) async {
    datasource.updateNote(note);
  }

  @override
  Future<void> addNotes(List<Note> notes) async {
    datasource.addNotes(notes);
  }
}
