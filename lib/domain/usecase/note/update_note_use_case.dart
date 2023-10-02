import 'package:jot_down/domain/model/note.dart';

abstract class UpdateNoteUseCase {
  Future<void> call(Note note);
}
