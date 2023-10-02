part of 'note_detail_bloc.dart';

class NoteDetailState extends Equatable {
  final Note? note;

  const NoteDetailState({this.note});

  @override
  List<Object?> get props => [note];
}
