import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/remote/model/data_result.dart';

abstract class GetNotesFromApiUseCase {
  Future<DataResult<List<Note>>> call();
}
