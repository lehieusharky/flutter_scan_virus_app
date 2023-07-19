import 'dart:io';
import 'package:dio/dio.dart';
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
    // TODO: move apiKey to .env file
    dio.options.headers['x-apikey'] =
    '2c8abdcd1eeb8377f75b168ed588c60e784b99a3c00f9c8893ee11983d92d584';
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
    final response = await dio.post(url, data: formData);
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