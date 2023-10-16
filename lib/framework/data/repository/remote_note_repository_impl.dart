import 'package:jot_down/domain/data/remote/datasource/note_remote_datasource.dart';
import 'package:jot_down/domain/data/repository/remote_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/remote/model/data_result.dart';

class RemoteNoteRepositoryImpl implements RemoteNoteRepository {
  NoteRemoteDatasource datasource;

  RemoteNoteRepositoryImpl({required this.datasource});

  @override
  Future<DataResult<void>> addNote(Note note) async {
    return datasource.addNote(note);
  }

  @override
  Future<DataResult<void>> deleteAllNotes() async {
    return datasource.deleteAllNotes();
  }

  @override
  Future<DataResult<void>> deleteNote(String id) async {
    return datasource.deleteNote(id);
  }

  @override
  Future<DataResult<List<Note>>> getNotes() {
    return datasource.getNotes();
  }

  @override
  Future<DataResult<void>> updateNote(Note note) async {
    return datasource.updateNote(note);
  }
}
