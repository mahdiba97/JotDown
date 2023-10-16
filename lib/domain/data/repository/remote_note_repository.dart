import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/remote/model/data_result.dart';

abstract class RemoteNoteRepository {
  Future<DataResult<List<Note>>> getNotes();

  Future<DataResult<void>> addNote(Note note);

  Future<DataResult<void>> updateNote(Note note);

  Future<DataResult<void>> deleteNote(String id);

  Future<DataResult<void>> deleteAllNotes();
}
