import 'package:injectable/injectable.dart';
import 'package:jot_down/framework/data/local/database/note_dao.dart';

@module
abstract class DatabaseModule {
  @singleton
  NoteDao get noteDao => NoteDao();
}
