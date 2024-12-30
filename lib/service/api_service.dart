import 'package:dio/dio.dart';

class DioService {
  late Dio dioClient;

  DioService() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: 'https://airdrop-token-api.jyczg888.uk/',
        connectTimeout: const Duration(microseconds: 50000), // 请求连接超时时间（毫秒）
        receiveTimeout: const Duration(microseconds: 3000), // 响应超时时间（毫秒）
        headers: {
          'Content-Type': 'application/json', // 默认请求头
        },
      ),
    );

    dioClient.interceptors.add(InterceptorsWrapper(
      // 请求拦截器
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.uri}');
        //  Token
        options.headers['Authorization'] = 'Bearer your-token';
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
  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await dioClient.get(endpoint);
      return response;
    } catch (e) {
      rethrow; // 错误捕获
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
