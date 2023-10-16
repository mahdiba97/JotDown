import 'package:dio/dio.dart';
import 'package:jot_down/framework/data/remote/model/exceptions.dart';
import 'package:jot_down/framework/data/remote/model/throws.dart';

class ErrorHandler<T> {
  @Throws([
    BadRequest,
    Unauthorized,
    NotFound,
    InternalServerError,
    UnknownError,
    DioException
  ])
  Future<T> handle(Future<Response> Function() requestFunction) async {
    var response = await requestFunction();
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw const BadRequest();
      case 401:
        throw const Unauthorized();
      case 404:
        throw const NotFound();
      case 500:
        throw const InternalServerError();
      default:
        throw UnknownError(message: response.statusMessage);
    }
  }
}
