import 'package:jot_down/domain/data/local/datasource/note_datasource.dart';
import 'package:jot_down/domain/data/repository/note_repository.dart';
import 'package:jot_down/domain/model/mapper.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/local/database/note_dao.dart';
import 'package:jot_down/framework/data/local/datasource/note_datasource_impl.dart';
import 'package:jot_down/framework/data/local/model/local_note.dart';
import 'package:jot_down/framework/data/repository/note_repository_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule {
  @Singleton()
  NoteDao get noteDao => NoteDao();

  @Singleton()
  NoteDatasource provideNoteDatasource(
          NoteDao noteDao, Mapper<Note, LocalNote> mapper) =>
      NoteDatasourceImpl(mapper: mapper, dao: noteDao);

  @Singleton()
  NoteRepository provideNoteRepository(NoteDatasource noteDatasource) =>
      NoteRepositoryImpl(datasource: noteDatasource);
}
