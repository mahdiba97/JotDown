import 'package:dio/dio.dart';
import 'package:jot_down/framework/data/remote/model/remote_note.dart';

class NoteApi {
  final Dio _dio;

  NoteApi(this._dio);

  Future<Response> addNote(RemoteNote note) async {
    Response response = await _dio.post('/notes.json', data: note.toMap());
    String newNoteId = response.data['name'];
    await _dio.patch('/notes/$newNoteId.json', data: {'id': newNoteId});
    return response;
  }

  Future<Response> getNote(String id) async {
    Response response = await _dio.get('/notes/$id.json');
    return response;
  }

  Future<Response> updateNote(RemoteNote note) async {
    Response response =
        await _dio.put('/notes/${note.id}.json', data: note.toMap());
    return response;
  }

  Future<Response> deleteNote(String id) async {
    Response response = await _dio.delete('/notes/$id.json');
    return response;
  }

  Future<Response> deleteNotes() async {
    Response response = await _dio.delete('/notes.json');
    return response;
  }

  Future<Response> getNotes() async {
    Response response = await _dio.get('/notes.json');
    return response;
  }

  Future<Response> setNotes(List<RemoteNote> notes) async {
    Response response = await _dio.put('/notes.json', data: notes);
    return response;
  }
}
