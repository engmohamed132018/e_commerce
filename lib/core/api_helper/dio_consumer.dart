import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_helper/api_consumer.dart';
import 'package:e_commerce/core/api_helper/api_endpoint.dart';
import 'package:e_commerce/core/api_helper/api_inceptor.dart';
import 'package:e_commerce/core/errors/server_exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors
        .add(LogInterceptor(error: true, request: true, requestHeader: true));
    dio.options.baseUrl = EndPiont.baseUrl;
  }
  @override
  Future delete(String path,
      {data, Map<String, dynamic>? queryParmater, bool? isDataMap}) {
    throw UnimplementedError();
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParmater}) async {
    try {
      final Response response =
          await dio.get(path, data: data, queryParameters: queryParmater);
      return response.data;
    } on DioException catch (e) {
      exceptionHandel(e);
    }
  }

  @override
  Future post(String path,
      {data, Map<String, dynamic>? queryParmater, bool? isDataMap}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path,
      {data, bool? isDataMap, Map<String, dynamic>? queryParmater}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
