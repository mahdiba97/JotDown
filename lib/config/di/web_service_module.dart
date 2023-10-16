import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jot_down/framework/data/remote/dio/network_manager.dart';
import 'package:jot_down/framework/data/remote/dio/note_api.dart';

@module
abstract class WebServiceModule {
  @singleton
  Dio get dio => NetworkManager.dio;

  @singleton
  NoteApi provideNoteApi(Dio dio) => NoteApi(dio);
}
