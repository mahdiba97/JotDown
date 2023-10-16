import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/data/repository/remote_note_repository.dart';
import 'package:jot_down/domain/usecase/note/add_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart';
import 'package:jot_down/domain/usecase/sync/get_notes_from_api_use_case.dart';
import 'package:jot_down/domain/usecase/sync/sync_database_use_case.dart';
import 'package:jot_down/framework/usecase/note/add_note_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/delete_all_notes_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/delete_note_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/get_all_notes_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/update_note_use_case_impl.dart';
import 'package:jot_down/framework/usecase/sync/get_notes_from_api_use_case_impl.dart';
import 'package:jot_down/framework/usecase/sync/sync_database_use_case_impl.dart';

@module
abstract class UseCaseModule {
  @singleton
  GetAllNotesUseCase provideGetAllNotesUseCase(
          LocalNoteRepository repository) =>
      GetAllNotesUseCaseImpl(repository: repository);

  @singleton
  DeleteNoteUseCase provideDeleteNoteUseCase(LocalNoteRepository repository) =>
      DeleteNoteUseCaseImpl(repository: repository);

  @singleton
  DeleteAllNotesUseCase provideDeleteAllNotesUseCase(
          LocalNoteRepository repository) =>
      DeleteAllNotesUseCaseImpl(repository: repository);

  @singleton
  AddNoteUseCase provideAddNoteUseCase(LocalNoteRepository repository) =>
      AddNoteUseCaseImpl(repository: repository);

  @singleton
  UpdateNoteUseCase provideUpdateNoteUseCase(LocalNoteRepository repository) =>
      UpdateNoteUseCaseImpl(repository: repository);

  @singleton
  SyncDatabaseUseCase provideSyncDatabaseUseCase(
          LocalNoteRepository localRepository,
          RemoteNoteRepository remoteRepository) =>
      SyncDatabaseUseCaseImpl(
          remoteRepository: remoteRepository, localRepository: localRepository);

  @singleton
  GetNotesFromApiUseCase provideGetNotesFromApiUseCase(
          RemoteNoteRepository repository) =>
      GetNotesFromApiUseCaseImpl(repository: repository);
}
