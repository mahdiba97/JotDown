import 'package:equatable/equatable.dart';
import 'package:jot_down/domain/model/note.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  factory HomeEvent.addNoteClicked() = AddNoteClicked;

  factory HomeEvent.deleteAllNotesClicked() = DeleteAllNotesClicked;

  const factory HomeEvent.swipeNoteToDelete(Note note) = SwipeNoteToDelete;

  factory HomeEvent.loadNotes() = LoadNotes;
}

class AddNoteClicked extends HomeEvent {
  @override
  List<Object> get props => [];
}

class DeleteAllNotesClicked extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SwipeNoteToDelete extends HomeEvent {
  final Note note;

  const SwipeNoteToDelete(this.note);

  @override
  List<Object> get props => [note];
}

class LoadNotes extends HomeEvent {
  @override
  List<Object> get props => [];
}
