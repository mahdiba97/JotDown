import 'package:dio/dio.dart';
import 'package:jot_down/domain/data/remote/datasource/note_remote_datasource.dart';
import 'package:jot_down/domain/model/mapper.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/data/remote/dio/note_api.dart';
import 'package:jot_down/framework/data/remote/model/data_result.dart';
import 'package:jot_down/framework/data/remote/model/error_handler.dart';
import 'package:jot_down/framework/data/remote/model/exceptions.dart';
import 'package:jot_down/framework/data/remote/model/remote_note.dart';

class NoteRemoteDatasourceImpl extends NoteRemoteDatasource {
  Mapper<Note, RemoteNote> mapper;
  NoteApi api;

  NoteRemoteDatasourceImpl({required this.mapper, required this.api});

  @override
  Future<DataResult<void>> addNote(Note note) async {
    try {
      var remoteNote = mapper.from(note);
      await ErrorHandler().handle(() => api.addNote(remoteNote));
      return DataResult.success(null);
    } on DioException catch (exception) {
      return DataResult.failure(UnknownError(message: exception.message));
    } on Exception catch (exception) {
      return DataResult.failure(exception);
    }
  }

  @override
  Future<DataResult<void>> deleteAllNotes() async {
    try {
      await ErrorHandler().handle(() => api.deleteNotes());
      return DataResult.success(null);
    } on DioException catch (exception) {
      return DataResult.failure(UnknownError(message: exception.message));
    } on Exception catch (exception) {
      return DataResult.failure(exception);
    }
  }

  @override
  Future<DataResult<void>> deleteNote(String id) async {
    try {
      await ErrorHandler().handle(() => api.deleteNote(id));
      return DataResult.success(null);
    } on DioException catch (exception) {
      return DataResult.failure(UnknownError(message: exception.message));
    } on Exception catch (exception) {
      return DataResult.failure(exception);
    }
  }

  @override
  Future<DataResult<List<Note>>> getNotes() async {
    try {
      var responseData = await ErrorHandler<Map<String, dynamic>>()
          .handle(() => api.getNotes());
      var remoteNotes = responseData.entries
          .map((e) => RemoteNote.fromMap({'id': e.key, ...e.value}))
          .toList();
      return DataResult.success(remoteNotes.map((e) => mapper.to(e)).toList());
    } on DioException catch (exception) {
      return DataResult.failure(UnknownError(message: exception.message));
    } on Exception catch (exception) {
      return DataResult.failure(exception);
    }
  }

  @override
  Future<DataResult<void>> updateNote(Note note) async {
    try {
      var remoteNote = mapper.from(note);
      await ErrorHandler().handle(() => api.updateNote(remoteNote));
      return DataResult.success(null);
    } on DioException catch (exception) {
      return DataResult.failure(UnknownError(message: exception.message));
    } on Exception catch (exception) {
      return DataResult.failure(exception);
    }
  }

  @override
  Future<DataResult<void>> setNotes(List<Note> notes) async {
    try {
      var remoteNotes = notes.map((e) => mapper.from(e)).toList();
      await ErrorHandler().handle(() => api.setNotes(remoteNotes));
      return DataResult.success(null);
    } on DioException catch (exception) {
      return DataResult.failure(UnknownError(message: exception.message));
    } on Exception catch (exception) {
      return DataResult.failure(exception);
    }
  }
}
