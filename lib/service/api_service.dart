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
        // options.headers['Authorization'] = 'Bearer your-token';
        // options.headers['Authorization'] =
        //     "tma query_id=AAHVRDdKAgAAANVEN0or_NxU&user=%7B%22id%22%3A5540103381%2C%22first_name%22%3A%22condi%22%2C%22last_name%22%3A%22wu%22%2C%22username%22%3A%22condiwu%22%2C%22language_code%22%3A%22zh-hans%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FFse2JvWkpdPG4NkdfhaI8ys72ct9TjeWhX_BilIqnsgbU5_j85Kd-5b9sDDPnyXW.svg%22%7D&auth_date=1736323337&signature=-MmkgRIR930dbmJFe3r3X9OE8ehClIt9P4dm4L6W5FmaRxHvcsrxp2OJo-ei4dBs7_GPPmSBDJw8QpcR5fsmAw&hash=4d8893533d9e5a0645615f35b59abdde697459462382e9ea912027d1cbdb265e";

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
