class BadRequest implements Exception {
  const BadRequest();

  @override
  String toString() =>
      'The server could not understand the request due to invalid syntax.';
}

class Unauthorized implements Exception {
  const Unauthorized();

  @override
  String toString() =>
      'The client must authenticate itself to get the requested response.';
}

class NotFound implements Exception {
  const NotFound();

  @override
  String toString() => 'The server can not find the requested resource.';
}

class InternalServerError implements Exception {
  const InternalServerError();

  @override
  String toString() =>
      "The server has encountered a situation it doesn't know how to handle.";
}

class UnknownError implements Exception {
  String? message;

  UnknownError({
    this.message,
  });

  @override
  String toString() {
    return message ?? 'Unknown error';
  }
}
