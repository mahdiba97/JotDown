import 'package:equatable/equatable.dart';

class LocalNote extends Equatable {
  final String id;
  final String title;
  final String content;
  final int isSynced;
  final int isDeleted;

  const LocalNote({
    required this.id,
    required this.title,
    required this.content,
    required this.isSynced,
    required this.isDeleted,
  });

  @override
  List<Object> get props => [id, title, content, isSynced];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isSynced': isSynced,
      'isDeleted': isDeleted,
    };
  }

  factory LocalNote.fromMap(Map<String, dynamic> map) {
    return LocalNote(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      isSynced: map['isSynced'] as int,
      isDeleted: map['isDeleted'] as int,
    );
  }
}
