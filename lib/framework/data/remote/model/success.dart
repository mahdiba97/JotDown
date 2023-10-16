import 'data_result.dart';

class Success<T> implements DataResult<T> {
  final T data;

  Success(this.data);
}
