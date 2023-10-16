import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String title;
  final String content;
  final bool isSynced;
  final bool isDeleted;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.isSynced,
    required this.isDeleted,
  });

  Note copyWith({
    String? id,
    String? title,
    String? content,
    bool? isSynced,
    bool? isDeleted,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object> get props => [id, title, content, isSynced, isDeleted];
}
