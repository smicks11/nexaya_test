import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nexaya/app/app.logger.dart';
import 'package:nexaya/core/constants/constant.dart';
import 'package:nexaya/core/payload/base_payload.dart';

var log = getLogger('ApiServices');

const String _baseUrl = 'https://api.mockfly.dev/mocks';

var options = BaseOptions(
  baseUrl: _baseUrl,
);

Dio _dio = Dio(options);

Dio init() {
  Dio dio = _dio;
  dio.options.baseUrl = _baseUrl;
  return dio;
}

dynamic _jsonEncodeDateHandler(dynamic item) {
  if (item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}

String serializeBody(dynamic body) {
  return jsonEncode(body, toEncodable: _jsonEncodeDateHandler);
}

class ApiService {
  ApiService() {
    init();
  }

  Future<ApiResponse<T>> postApi<T>(
    String url,
    dynamic body, {
    Map<String, dynamic>? params,
    T Function(dynamic)? transform,
  }) async {
    transform ??= (dynamic r) => r.body as T;
    params ??= <String, dynamic>{};
    final ApiResponse<T> apiResponse = ApiResponse<T>();
    try {
      Response response = await _dio.post(url,
          options: Options(
            validateStatus: (_) => true,
          ),
          data: serializeBody(body),
          queryParameters: params);
      log.d("response.statusCode : ${response.statusCode}");
      final dynamic data = response.data;
      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        apiResponse.status = true;
        apiResponse.data = transform(data);
        apiResponse.message = data['message'];
      } else {
        apiResponse.status = false;
        apiResponse.message = data['message'];
      }
    } catch (e) {
      log.w("Error on catch block:-> $e");
      apiResponse.status = false;
      apiResponse.message = ErrorStatus.codeError;
    }
    return apiResponse;
  }
}
