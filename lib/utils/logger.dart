import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // 只打印2层调用栈
      errorMethodCount: 8, // 打印8层错误调用栈
      lineLength: 120, // 每行字符限制
      colors: true,
    ),
  );

  // 获取 Logger 实例
  static Logger get instance => _logger;
}
