import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/data/repository/note_repository.dart';
import 'package:jot_down/domain/usecase/note/add_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart';
import 'package:jot_down/framework/usecase/note/add_note_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/delete_all_notes_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/delete_note_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/get_all_notes_use_case_impl.dart';
import 'package:jot_down/framework/usecase/note/update_note_use_case_impl.dart';

@module
abstract class UseCaseModule {
  @singleton
  GetAllNotesUseCase provideGetAllNotesUseCase(NoteRepository repository) =>
      GetAllNotesUseCaseImpl(repository: repository);

  @Singleton()
  DeleteNoteUseCase provideDeleteNoteUseCase(NoteRepository repository) =>
      DeleteNoteUseCaseImpl(repository: repository);

  @Singleton()
  DeleteAllNotesUseCase provideDeleteAllNotesUseCase(
          NoteRepository repository) =>
      DeleteAllNotesUseCaseImpl(repository: repository);

  @Singleton()
  AddNoteUseCase provideAddNoteUseCase(NoteRepository repository) =>
      AddNoteUseCaseImpl(repository: repository);

  @Singleton()
  UpdateNoteUseCase provideUpdateNoteUseCase(NoteRepository repository) =>
      UpdateNoteUseCaseImpl(repository: repository);
}
