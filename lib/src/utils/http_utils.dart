import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart';
import 'package:virusscanapp/src/utils/http_interceptor.dart';

class HttpResponse<T> {
  HttpResponse({
    this.body,
    this.headers,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  T? body;
  Headers? headers;
  RequestOptions? request;
  int? statusCode;
  String? statusMessage;
  Map<String, dynamic>? extra;
}

class HttpHelper {
  static Dio getDio() {
    Dio dio = Dio();
    final apiKey = dotenv.get("API_KEY");
    dio.options.headers['x-apikey'] = apiKey;
    dio.interceptors.add(DioInterceptor());
    return dio;
  }

  static Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final dio = HttpHelper.getDio();
    final Response response = await dio.get(
      url,
      queryParameters: queryParameters,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<HttpResponse> post(
    String url, {
    required FormData? data,
  }) async {
    final dio = HttpHelper.getDio();
    final Response response = await dio.post(url, data: data);
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<HttpResponse> put(String url, Object data) async {
    final dio = HttpHelper.getDio();
    final Response response = await dio.put(url, data: data);
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<HttpResponse> delete(String url, [Object? data]) async {
    final dio = HttpHelper.getDio();
    final Response response = await dio.delete(url, data: data);
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<HttpResponse> uploadFile(String url,
      {required File file}) async {
    final dio = HttpHelper.getDio();
    final uploadFile = await MultipartFile.fromFile(
      file.path,
      filename: basename(file.path),
    );
    final formData = FormData.fromMap({'file': uploadFile});
    final response = await dio.post(
      url,
      data: formData,
      onSendProgress: (sentBytes, totalBytes) {
        final progress = (sentBytes / totalBytes * 100).toInt();
        log(progress.toString());
      },
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}
