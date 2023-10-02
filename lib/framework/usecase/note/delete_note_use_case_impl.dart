import 'package:jot_down/domain/data/repository/note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart';

class DeleteNoteUseCaseImpl extends DeleteNoteUseCase {
  NoteRepository repository;

  DeleteNoteUseCaseImpl({required this.repository});

  @override
  Future<void> call(Note note) {
    return repository.deleteNote(note);
  }
}
