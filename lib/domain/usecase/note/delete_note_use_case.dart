import 'package:jot_down/domain/model/note.dart';

abstract class DeleteNoteUseCase {
  Future<void> call(Note note);
}
