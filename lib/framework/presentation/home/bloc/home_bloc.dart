import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart';
import 'package:jot_down/domain/usecase/sync/get_notes_from_api_use_case.dart';
import 'package:jot_down/domain/usecase/sync/sync_database_use_case.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_effect.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_event.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_state.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

@injectable
class HomeBloc extends SideEffectBloc<HomeEvent, HomeState, HomeEffect> {
  GetAllNotesUseCase getAllNotesUseCase;
  DeleteAllNotesUseCase deleteAllNotesUseCase;
  DeleteNoteUseCase deleteNoteUseCase;
  SyncDatabaseUseCase syncDatabaseUseCase;
  GetNotesFromApiUseCase getNotesFromApiUseCase;
  UpdateNoteUseCase updateNoteUseCase;

  HomeBloc({
    required this.getAllNotesUseCase,
    required this.deleteAllNotesUseCase,
    required this.deleteNoteUseCase,
    required this.syncDatabaseUseCase,
    required this.getNotesFromApiUseCase,
    required this.updateNoteUseCase,
  }) : super(const HomeState(notes: [])) {
    on<AddNoteClicked>((event, emit) {
      produceSideEffect(HomeEffect.gotoNoteDetails());
    });

    on<DeleteAllNotesClicked>((event, emit) async {
      if (state.notes.isNotEmpty) {
        await deleteAllNotesUseCase.call();
        produceSideEffect(HomeEffect.deleteAllNotesDone());
        emit(state.copyWith(notes: []));
      }
    });

    on<SwipeNoteToDelete>((event, emit) async {
      await updateNoteUseCase
          .call(event.note.copyWith(isDeleted: true, isSynced: false));
      produceSideEffect(HomeEffect.deleteNoteDone());
      // add(InitialData());
      // produceSideEffect(HomeEffect.deleteNoteDone());
      // add(InitialData());
    });

    on<InitialData>((event, emit) async {
      await syncDatabaseUseCase.call();
      var value = await getAllNotesUseCase.call().then(
          (value) => value.where((element) => !element.isDeleted).toList());

      emit(state.copyWith(notes: value));
      produceSideEffect(HomeEffect.finishLoading());
    });

    on<SyncData>((event, emit) async {
      String syncResult = await syncDatabaseUseCase.call();
      produceSideEffect(HomeEffect.syncFinished(syncResult));
    });
  }
}
