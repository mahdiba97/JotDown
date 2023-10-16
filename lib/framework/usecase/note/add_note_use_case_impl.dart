import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/note/add_note_use_case.dart';

class AddNoteUseCaseImpl extends AddNoteUseCase {
  LocalNoteRepository repository;

  AddNoteUseCaseImpl({required this.repository});

  @override
  Future<void> call(Note note) {
    return repository.addNote(note);
  }
}
