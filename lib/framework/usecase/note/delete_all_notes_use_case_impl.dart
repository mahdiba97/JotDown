import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart';

class DeleteAllNotesUseCaseImpl extends DeleteAllNotesUseCase {
  LocalNoteRepository repository;

  DeleteAllNotesUseCaseImpl({required this.repository});

  @override
  Future<void> call() {
    return repository.deleteAllNotes();
  }
}
