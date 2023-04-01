import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sample_weather_app/domain/models/HttpResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_weather_app/domain/models/HttpResponse.java';


class RestClient {
  late Dio _dio;
  late SharedPreferences pref;
  final String baseUrl;

  RestClient({
    required this.baseUrl,
  }) {
    _initRest();
  }

  void _initRest({Function(Dio)? func}) async {
    pref = await SharedPreferences.getInstance();
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
    _dio = Dio(options);
    _dio.interceptors.clear();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
    ));
    _dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      options.headers["Content-Type"] = "application/json";
      options.headers["Accept"] = 'application/json';

      if (options.queryParameters.isEmpty) {
        return handler.next(options);
      }
      final queryParams = _getQueryParams(options.queryParameters);
      return handler.next(
        options.copyWith(
          path: _getNormalizedUrl(options.path, queryParams),
          queryParameters: Map.from({}),
        ),
      );
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          RequestOptions requestOptions = e.requestOptions;
          final opts = Options(method: requestOptions.method);
          final response = await _dio.request(requestOptions.path,
              options: opts,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
          return handler.resolve(response);
        } else {
          return handler.next(e);
        }
      } else {
        return handler.next(e);
      }
    }));
  }

  bool _isStatusCodeSuccessfully(int code) {
    return code < 300 && code >= 200;
  }

  String _getNormalizedUrl(String baseUrl, String queryParams) {
    if (baseUrl.contains("?")) {
      return "$baseUrl&$queryParams";
    } else {
      return "$baseUrl?$queryParams";
    }
  }

  String _getQueryParams(Map<String, dynamic> map) {
    String result = "";
    map.forEach((key, value) {
      result += "$key=${Uri.encodeComponent(value)}&";
    });
    return result;
  }


  Future<HttpResponse> get(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.get(path,
          options: options,
          queryParameters: queryParameters,
          cancelToken: cancelToken);
      return HttpResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    }  catch (e) {
      return HttpResponse(
        error: e.toString(),
        isSuccess: false
      );
    }
  }
}
