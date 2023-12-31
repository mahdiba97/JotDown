import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart';

class GetAllNotesUseCaseImpl extends GetAllNotesUseCase {
  LocalNoteRepository repository;

  GetAllNotesUseCaseImpl({required this.repository});

  @override
  Future<List<Note>> call() {
    return repository.getNotes();
  }
}
