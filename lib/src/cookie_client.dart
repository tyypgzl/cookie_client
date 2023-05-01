import 'package:cookie_client/src/enums/content_type.dart';
import 'package:cookie_client/src/enums/http_method_enum.dart';
import 'package:cookie_client/src/handler/cookie_handler.dart';
import 'package:cookie_client/src/models/cookie_inspector.dart';
import 'package:cookie_client/src/models/cookie_logger.dart';
import 'package:cookie_client/src/models/cookie_network_model.dart';
import 'package:cookie_client/src/models/failures.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CookieClient {
  CookieClient({
    required String baseUrl,
    Map<String, dynamic>? headers,
    CookieContentType contentType = CookieContentType.jsonContentType,
    Duration connectTimeout = const Duration(seconds: 5),
    Duration receiveTimeout = const Duration(seconds: 5),
    Duration sendTimeout = const Duration(seconds: 5),
    ResponseType? responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
    CookieLogger logger = const CookieLogger(),
    CookieInspector inspector = const CookieInspector(),
  }) {
    final options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType.value,
      baseUrl: baseUrl,
      headers: headers,
      responseType: responseType,
      queryParameters: queryParameters,
    );
    _dio = Dio(options);
    // _chuck = Chuck(
    //   darkTheme: inspector.themeMode == ThemeMode.dark,
    //   navigatorKey: inspector.navigatorKey,
    //   showInspectorOnShake: inspector.showInspectorOnShake,
    //   showNotification: inspector.showNotification,
    // );

    final prettyDioLogger = PrettyDioLogger(
      request: logger.request,
      requestHeader: logger.requestHeader,
      requestBody: logger.requestBody,
      responseBody: logger.responseBody,
      responseHeader: logger.responseHeader,
    );

    if (logger.showLogger) {
      _dio.interceptors.add(prettyDioLogger);
    }
    if (inspector.showNotification) {
      // _dio.interceptors.add(_chuck.getDioInterceptor());
    }
  }

  ///[Dio] Object for Network Request.
  ///The initialization is done in the constructor method.
  late final Dio _dio;

  // late final Chuck _chuck;

  ///Handy method to make [HttpMethod.POST] request.
  ///[data] must be of type [Map].
  Future<K> post<R extends CookieNetworkModel<Object>, K>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required R responseModel,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    CookieContentType contentType = CookieContentType.jsonContentType,
  }) async {
    try {
      final dioResponse = await _dio.post<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType.value,
          method: HttpMethod.POST.name,
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  ///Handy method to make [HttpMethod.GET] request.
  ///data must be of type [Map].
  Future<String?> getString(
    String path, {
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    CookieContentType contentType = CookieContentType.jsonContentType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dioResponse = await _dio.get<String>(
        path,
        queryParameters: queryParameters,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType.value,
          method: HttpMethod.GET.name,
        ),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      return dioResponse.data;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  ///Handy method to make [HttpMethod.GET] request.
  ///data must be of type [Map].
  Future<K> get<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    CookieContentType contentType = CookieContentType.jsonContentType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dioResponse = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType.value,
          method: HttpMethod.GET.name,
        ),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  ///Handy method to make [HttpMethod.DELETE] request.
  ///[data] must be of type [Map].
  Future<K> delete<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CookieContentType contentType = CookieContentType.jsonContentType,
    ResponseType responseType = ResponseType.json,
    CancelToken? cancelToken,
  }) async {
    try {
      final dioResponse = await _dio.delete<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType.value,
          method: HttpMethod.DELETE.name,
        ),
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  ///Handy method to make [HttpMethod.PUT] request.
  ///[data] must be of type [Map].
  Future<K> put<R extends CookieNetworkModel<Object>, K>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required R responseModel,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    CookieContentType contentType = CookieContentType.jsonContentType,
  }) async {
    try {
      final dioResponse = await _dio.put<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onSendProgress,
        onSendProgress: onSendProgress,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType.value,
          method: HttpMethod.PUT.name,
        ),
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  ///Handy method to make [HttpMethod.PATCH] request.
  ///[data] must be of type [Map].
  Future<K> patch<R extends CookieNetworkModel<Object>, K>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required R responseModel,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    CookieContentType contentType = CookieContentType.jsonContentType,
  }) async {
    try {
      final dioResponse = await _dio.patch<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onSendProgress,
        onSendProgress: onSendProgress,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType.value,
          method: HttpMethod.PATCH.name,
        ),
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  Future<Response<dynamic>> download({
    required String urlPath,
    required String filePath,
    dynamic data,
    bool deleteOnError = true,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    ResponseType responseType = ResponseType.bytes,
  }) async {
    try {
      final result = await _dio.download(
        urlPath,
        filePath,
        onReceiveProgress: onReceiveProgress,
        data: data,
        deleteOnError: deleteOnError,
        cancelToken: cancelToken,
        options: Options(
          responseType: responseType,
        ),
      );
      return result;
    } on DioError catch (dioError) {
      throw CookieFailureHandler.fromDioError(dioError);
    }
  }

  K _convertToGenericType<R extends CookieNetworkModel<Object>, K>(
    Response<dynamic> dioResponse,
    R responseModel,
  ) {
    try {
      if (dioResponse.statusCode != null &&
          dioResponse.statusCode! >= 200 &&
          dioResponse.statusCode! <= 299) {
        final data = dioResponse.data;
        if (data is List) {
          final typedListModel = List<R>.from(
            data
                .map(
                  (e) => responseModel.fromJson(e as Map<String, dynamic>) as R,
                )
                .toList(),
          ) as K;
          return typedListModel;
        } else {
          final typedModel =
              responseModel.fromJson(data as Map<String, dynamic>) as K;
          return typedModel;
        }
      } else {
        throw OtherFailure();
      }
    } catch (error) {
      throw JsonParseFailure(error.toString());
    }
  }
}
