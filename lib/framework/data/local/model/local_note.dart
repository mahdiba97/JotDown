import 'package:equatable/equatable.dart';

class LocalNote extends Equatable {
  final String id;
  final String title;
  final String content;

  const LocalNote({
    required this.id,
    required this.title,
    required this.content,
  });

  @override
  List<Object> get props => [id, title, content];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory LocalNote.fromMap(Map<String, dynamic> map) {
    return LocalNote(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }
}
