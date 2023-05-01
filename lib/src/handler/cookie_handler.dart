import 'package:cookie_client/src/models/cookie_failure.dart';
import 'package:cookie_client/src/models/failures.dart';
import 'package:dio/dio.dart';

abstract class CookieFailureHandler {
  static CookieFailure fromDioError(DioError dioError) {
    late CookieFailure error;
    switch (dioError.type) {
      case DioErrorType.badCertificate:
        error = BadCertificateFailure();
        break;
      case DioErrorType.cancel:
        error = CancelFailure();
        break;

      case DioErrorType.connectionTimeout:
        error = ConnectTimeoutFailure();
        break;

      case DioErrorType.receiveTimeout:
        error = ReceiveTimeoutFailure();
        break;

      case DioErrorType.sendTimeout:
        error = SendTimeoutFailure();
        break;

      case DioErrorType.connectionError:
        error = ConnectionFailure();
        break;

      case DioErrorType.badResponse:
        error = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;

      case DioErrorType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          error = ConnectionFailure();
          break;
        }
        error = OtherFailure();
        break;

      default:
        error = OtherFailure();
        break;
    }

    return error;
  }

  static CookieFailure _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return BadRequestError();
      case 401:
        return UnAuthorizedError();
      case 403:
        return ForbiddenError();
      case 404:
        return NotFoundError(description: error.toString());
      case 500:
        return IntervalServerError();
      case 502:
        return BadGatewayError();
      default:
        return OtherFailure();
    }
  }
}
