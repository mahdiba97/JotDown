import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart';

class UpdateNoteUseCaseImpl extends UpdateNoteUseCase {
  LocalNoteRepository repository;

  UpdateNoteUseCaseImpl({required this.repository});

  @override
  Future<void> call(Note note) {
    return repository.updateNote(note);
  }
}
