import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/data/local/datasource/note_datasource.dart';
import 'package:jot_down/domain/data/remote/datasource/note_remote_datasource.dart';
import 'package:jot_down/domain/model/mapper.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/local/database/note_dao.dart';
import 'package:jot_down/framework/data/local/datasource/note_datasource_impl.dart';
import 'package:jot_down/framework/data/local/model/local_note.dart';
import 'package:jot_down/framework/data/remote/datasource/note_remote_datasource_impl.dart';
import 'package:jot_down/framework/data/remote/dio/note_api.dart';
import 'package:jot_down/framework/data/remote/model/remote_note.dart';

@module
abstract class DatasourceModule {
  @singleton
  NoteDatasource provideLocalNoteDatasource(
          NoteDao noteDao, Mapper<Note, LocalNote> mapper) =>
      NoteDatasourceImpl(mapper: mapper, dao: noteDao);

  @singleton
  NoteRemoteDatasource provideRemoteNoteDatasource(
          NoteApi noteApi, Mapper<Note, RemoteNote> mapper) =>
      NoteRemoteDatasourceImpl(mapper: mapper, api: noteApi);
}
