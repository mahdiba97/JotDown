class RemoteNote {
  final String id;
  final String title;
  final String content;

  RemoteNote({
    required this.id,
    required this.title,
    required this.content,
  });

  factory RemoteNote.fromMap(Map<String, dynamic> map) {
    return RemoteNote(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
