import 'package:jot_down/domain/model/note.dart';

abstract class AddNoteUseCase {
  Future<void> call(Note note);
}
