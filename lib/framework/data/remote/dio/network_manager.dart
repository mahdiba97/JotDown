import 'package:dio/dio.dart';

class NetworkManager {
  static BaseOptions options = BaseOptions(
    baseUrl: "https://jotdown-fac7a-default-rtdb.firebaseio.com",
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
  );

  static Dio dio = Dio(options);
}
