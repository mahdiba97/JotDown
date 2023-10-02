import 'package:injectable/injectable.dart';
import 'package:jot_down/domain/model/mapper.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/local/model/local_note.dart';

@Injectable(as: Mapper<Note, LocalNote>)
class LocalNoteMapper implements Mapper<Note, LocalNote> {
  @override
  LocalNote from(Note note) {
    return LocalNote(
      id: note.id,
      title: note.title,
      content: note.content,
    );
  }

  @override
  Note to(LocalNote localNote) {
    return Note(
      id: localNote.id,
      title: localNote.title,
      content: localNote.content,
    );
  }
}
