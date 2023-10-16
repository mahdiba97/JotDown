import 'package:jot_down/framework/data/remote/model/failure.dart';
import 'package:jot_down/framework/data/remote/model/success.dart';

abstract class DataResult<T> {
  factory DataResult.success(T data) => Success(data);

  factory DataResult.failure(Exception error) => Failure(error);
}
