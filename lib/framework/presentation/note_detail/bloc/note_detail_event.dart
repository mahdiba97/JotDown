part of 'note_detail_bloc.dart';

abstract class NoteDetailEvent extends Equatable {
  const NoteDetailEvent();

  const factory NoteDetailEvent.apply(
      {String? id,
      bool? isSynced,
      required String title,
      required String content}) = Apply;
}

class Apply extends NoteDetailEvent {
  final String? id;
  final bool? isSynced;
  final String title;
  final String content;

  const Apply({
    this.id,
    this.isSynced,
    required this.title,
    required this.content,
  }) : super();

  @override
  List<Object?> get props => [id, title, content];
}
