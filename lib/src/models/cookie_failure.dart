import 'package:cookie_client/src/enums/failure_type.dart';

abstract class CookieFailure implements Exception {
  CookieFailure({
    required this.message,
    required this.failureType,
    this.statusCode,
    this.description,
  });

  final String message;
  final int? statusCode;
  final String? description;
  final CookieFailureType failureType;

  @override
  String toString() {
    return 'CookieFailure{message: $message, statusCode: $statusCode, '
        'description: $description, failureType: $failureType}';
  }
}
