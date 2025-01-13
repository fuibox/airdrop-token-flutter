import 'package:airdrop_flutter/utils/logger.dart';
import 'package:dio/dio.dart';

class DioService {
  late Dio dioClient;

  DioService() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: 'https://airdrop-token-api.jyczg888.uk/',
        connectTimeout: const Duration(seconds: 10), // 请求连接超时时间（毫秒）
        receiveTimeout: const Duration(seconds: 10), // 响应超时时间（毫秒）
        headers: {
          'Content-Type': 'application/json; charset=utf-8', // 默认请求头
        },
      ),
    );

    dioClient.interceptors.add(InterceptorsWrapper(
      // 请求拦截器
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.uri}');
        //  Token
        AppLogger.instance.d(options.headers['Authorization']);

        return handler.next(options); // next
      },

      // 响应拦截器
      onResponse: (response, handler) {
        print('Response: ${response.statusCode} ${response.data}');
        return handler.next(response); // next
      },

      // 错误拦截器
      onError: (error, handler) {
        print('Error: ${error.message}');
        return handler.next(error); // next
      },
    ));
  }

  // GET 请求方法
  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      Options options = Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      );
      if (queryParams != null && queryParams.isNotEmpty) {
        // 使用 Uri 类构建完整的包含查询参数的 URL
        Uri uri = Uri.parse(endpoint).replace(queryParameters: queryParams);
        endpoint = uri.toString();
      }
      final response = await dioClient.get(endpoint, options: options);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST 请求方法
  Future<Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dioClient.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow; // 错误捕获
    }
  }
}

final dioService = DioService(); // 实例化全局 Dio
