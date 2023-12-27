class ServerException implements Exception {
  final String errorCode;
  final String errorMessage;

  ServerException({
    required this.errorCode,
    required this.errorMessage
  });
}