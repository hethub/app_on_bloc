import 'package:dio/dio.dart';

class HttpResponse<T> {
  final T data;
  final Response response;
  HttpResponse({required this.data, required this.response});
}
