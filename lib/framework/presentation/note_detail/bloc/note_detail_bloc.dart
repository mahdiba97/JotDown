import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/note/add_note_use_case.dart';
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart';
import 'package:jot_down/framework/presentation/note_detail/bloc/note_detail_effect.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:uuid/uuid.dart';

part 'note_detail_event.dart';
part 'note_detail_state.dart';

@injectable
class NoteDetailBloc
    extends SideEffectBloc<NoteDetailEvent, NoteDetailState, NoteDetailEffect> {
  UpdateNoteUseCase updateNoteUseCase;

  AddNoteUseCase addNoteUseCase;

  NoteDetailBloc(
      {required this.updateNoteUseCase, required this.addNoteUseCase})
      : super(const NoteDetailState()) {
    on<Apply>((event, emit) async {
      produceSideEffect(NoteDetailEffect.onProgress());
      String title = event.title;
      String content = event.content;
      if (event.id != null && event.id!.isNotEmpty) {
        await updateNoteUseCase.call(Note(
            id: event.id!,
            isSynced: event.isSynced!,
            isDeleted: false,
            title: title,
            content: content));
      } else {
        var uuid = const Uuid();
        await addNoteUseCase.call(Note(
            id: uuid.v4(),
            isSynced: false,
            isDeleted: false,
            title: title,
            content: content));
      }
      produceSideEffect(NoteDetailEffect.applyDone());
    });
  }
}
