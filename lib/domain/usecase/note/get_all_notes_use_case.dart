import 'package:jot_down/domain/model/note.dart';

abstract class GetAllNotesUseCase {
  Future<List<Note>> call();
}
