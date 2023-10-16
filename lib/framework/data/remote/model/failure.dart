import 'data_result.dart';

class Failure<T> implements DataResult<T> {
  final Exception error;

  Failure(this.error);
}
