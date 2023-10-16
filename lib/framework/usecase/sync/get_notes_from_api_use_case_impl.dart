import 'package:jot_down/domain/data/repository/remote_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/sync/get_notes_from_api_use_case.dart';
import 'package:jot_down/framework/data/remote/model/data_result.dart';

class GetNotesFromApiUseCaseImpl implements GetNotesFromApiUseCase {
  RemoteNoteRepository repository;

  GetNotesFromApiUseCaseImpl({required this.repository});

  @override
  Future<DataResult<List<Note>>> call() async {
    var dataResult = await repository.getNotes();
    return dataResult;
  }
}
