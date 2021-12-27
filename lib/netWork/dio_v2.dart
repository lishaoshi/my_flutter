import 'dio_client.dart';
import 'package:dio/dio.dart';

Http http = Http();

class Http extends HttpUtils {
  static late final Http _instance = Http._internal();
  factory Http() {
    return _instance;
  }
  Http._internal() {
    init();
  }
  init() {
    options = BaseOptions(
        baseUrl: 'https://autumnfish.cn/',
        connectTimeout: 5 * 10000,
        sendTimeout: 5 * 1000,
        receiveTimeout: 5 * 1000);
  }
}
