import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart';
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_effect.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_event.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_state.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

@injectable
class HomeBloc extends SideEffectBloc<HomeEvent, HomeState, HomeEffect> {
  GetAllNotesUseCase getAllNotesUseCase;
  DeleteAllNotesUseCase deleteAllNotesUseCase;
  DeleteNoteUseCase deleteNoteUseCase;

  HomeBloc({
    required this.getAllNotesUseCase,
    required this.deleteAllNotesUseCase,
    required this.deleteNoteUseCase,
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
      await deleteNoteUseCase.call(event.note);
      produceSideEffect(HomeEffect.deleteNoteDone());
      add(LoadNotes());
    });

    on<LoadNotes>((event, emit) async {
      var value = await getAllNotesUseCase.call();
      emit(state.copyWith(notes: value));
      produceSideEffect(HomeEffect.finishLoading());
    });
  }
}
