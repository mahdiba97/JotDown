import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/data/local/datasource/note_datasource.dart';
import 'package:jot_down/domain/data/remote/datasource/note_remote_datasource.dart';
import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/data/repository/remote_note_repository.dart';
import 'package:jot_down/framework/data/repository/local_note_repository_impl.dart';
import 'package:jot_down/framework/data/repository/remote_note_repository_impl.dart';

@module
abstract class RepositoryModule {
  @singleton
  LocalNoteRepository provideLocalNoteRepository(
          NoteDatasource noteDatasource) =>
      NoteRepositoryImpl(datasource: noteDatasource);

  @singleton
  RemoteNoteRepository provideRemoteNoteRepository(
          NoteRemoteDatasource datasource) =>
      RemoteNoteRepositoryImpl(datasource: datasource);
}
