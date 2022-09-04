abstract class NetworkException implements Exception {
  dynamic response;

  NetworkException(this.response);
}

class ServerException extends NetworkException {
  ServerException(dynamic response) : super(response);
}

class BadRequestException extends NetworkException {
  BadRequestException(dynamic response) : super(response);
}

abstract class StorageException implements Exception {}

class BadDataException extends StorageException {}

class DataNotFoundException extends StorageException {}
