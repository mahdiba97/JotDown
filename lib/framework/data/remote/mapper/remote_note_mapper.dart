import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/model/mapper.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/local/model/local_note.dart';
import 'package:jot_down/framework/data/remote/model/remote_note.dart';

@Injectable(as: Mapper<Note, LocalNote>)
class RemoteNoteMapper implements Mapper<Note, RemoteNote> {
  @override
  RemoteNote from(Note note) {
    return RemoteNote(
      id: note.id,
      title: note.title,
      content: note.content,
    );
  }

  @override
  Note to(RemoteNote remoteNote) {
    return Note(
      id: remoteNote.id,
      title: remoteNote.title,
      content: remoteNote.content,
      isSynced: true,
      isDeleted: false,
    );
  }
}
