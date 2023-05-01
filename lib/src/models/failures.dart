import 'package:cookie_client/src/enums/failure_type.dart';
import 'package:cookie_client/src/models/cookie_failure.dart';

class JsonParseFailure implements CookieFailure {
  JsonParseFailure(this.errorMessage);

  final String errorMessage;
  @override
  String? description = 'Json Parse Error';

  @override
  String get message => errorMessage;

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.jsonParse;
}

class CancelFailure implements CookieFailure {
  @override
  String? description = 'DioErrorType.cancel';

  @override
  String get message => 'Request to API server was cancelled';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.dioCancel;
}

class BadCertificateFailure implements CookieFailure {
  @override
  String? description = 'DioErrorType.badCertificate';

  @override
  String get message => 'Bad Certificate';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.dioBadCertificate;
}

class ConnectTimeoutFailure implements CookieFailure {
  @override
  String? description = 'DioErrorType.connectTimeout';

  @override
  String get message => 'Connection timeout with API server';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.dioConnectTimeout;
}

class ReceiveTimeoutFailure implements CookieFailure {
  @override
  String? description = 'DioErrorType.receiveTimeout';

  @override
  String get message => 'Receive timeout in connection with API server';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.dioReceiveTimeOut;
}

class SendTimeoutFailure implements CookieFailure {
  @override
  String? description = 'DioErrorType.sendTimeout';

  @override
  String get message => 'Send timeout in connection with API server';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.dioSendTimeOut;
}

class ConnectionFailure implements CookieFailure {
  @override
  String? description = 'Socket Exception';

  @override
  String get message => 'Check your internet connection.';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.connection;
}

class OtherFailure implements CookieFailure {
  @override
  String? description = 'Other';

  @override
  String get message => 'Something went wrong';

  @override
  int? statusCode;

  @override
  CookieFailureType get failureType => CookieFailureType.other;
}

class BadRequestError implements CookieFailure {
  @override
  String? description = 'Bad Request';

  @override
  String get message => 'Check the request message.';

  @override
  int? statusCode = 400;

  @override
  CookieFailureType get failureType => CookieFailureType.badRequest;
}

class UnAuthorizedError implements CookieFailure {
  @override
  String? description = 'Unauthorized';

  @override
  String get message => 'Check the authentication information.';

  @override
  int? statusCode = 401;

  @override
  CookieFailureType get failureType => CookieFailureType.unAuthorized;
}

class PaymentError implements CookieFailure {
  @override
  String? description = 'Payment Required';

  @override
  String get message => 'Check the payment.';

  @override
  int? statusCode = 402;

  @override
  CookieFailureType get failureType => CookieFailureType.payment;
}

class ForbiddenError implements CookieFailure {
  @override
  String? description = 'Forbidden';

  @override
  String get message =>
      'The server received the request but refused authorization.';

  @override
  int? statusCode = 403;

  @override
  CookieFailureType get failureType => CookieFailureType.forbidden;
}

class NotFoundError implements CookieFailure {
  NotFoundError({this.description});

  @override
  String? description = 'Not Found';

  @override
  String get message => 'The server could not find the requested resource.';

  @override
  int? statusCode = 404;

  @override
  CookieFailureType get failureType => CookieFailureType.notFound;
}

class IntervalServerError implements CookieFailure {
  @override
  String? description = 'Interval Server';

  @override
  String get message => 'The server encountered an unexpected error.';

  @override
  int? statusCode = 500;

  @override
  CookieFailureType get failureType => CookieFailureType.intervalServer;
}

class BadGatewayError implements CookieFailure {
  @override
  String? description = 'Bad Gateway';

  @override
  String get message => 'the server received an invalid response '
      'from the upstream server as a gateway.';

  @override
  int? statusCode = 502;

  @override
  CookieFailureType get failureType => CookieFailureType.badGateway;
}
