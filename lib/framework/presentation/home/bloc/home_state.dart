import 'package:equatable/equatable.dart';
import 'package:jot_down/domain/model/note.dart';

class HomeState extends Equatable {
  final List<Note> notes;
  final Note? deletedNote;
  final int? deletedNoteIndex;

  const HomeState(
      {required this.notes, this.deletedNote, this.deletedNoteIndex});

  HomeState copyWith(
      {List<Note>? notes, Note? deletedNote, int? deletedNoteIndex}) {
    return HomeState(
      notes: notes ?? this.notes,
      deletedNote: deletedNote ?? this.deletedNote,
      deletedNoteIndex: deletedNoteIndex ?? this.deletedNoteIndex,
    );
  }

  @override
  List<Object?> get props => [notes, deletedNote, deletedNoteIndex];
}
