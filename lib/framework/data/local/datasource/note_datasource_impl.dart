import 'package:jot_down/domain/data/local/datasource/note_datasource.dart';
import 'package:jot_down/domain/model/mapper.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/local/database/note_dao.dart';
import 'package:jot_down/framework/data/local/model/local_note.dart';

class NoteDatasourceImpl extends NoteDatasource {
  Mapper<Note, LocalNote> mapper;
  NoteDao dao;

  NoteDatasourceImpl({required this.mapper, required this.dao});

  @override
  Future<void> addNote(Note note) async {
    dao.insert(mapper.from(note));
  }

  @override
  Future<void> deleteAllNotes() async {
    dao.deleteAllNotes();
  }

  @override
  Future<void> deleteNote(Note note) async {
    dao.deleteNote(mapper.from(note));
  }

  @override
  Future<List<Note>> getNotes() async {
    return dao
        .getNotes()
        .then((value) => value.map((e) => mapper.to(e)).toList());
  }

  @override
  Future<void> updateNote(Note note) async {
    dao.updateNote(mapper.from(note));
  }

  @override
  Future<void> addNotes(List<Note> notes) async {
    dao.addNotes(notes.map(mapper.from).toList());
  }
}
