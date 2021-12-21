import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'error_interceptor.dart';

HttpUtil http = HttpUtil();

HttpUtil http2 = HttpUtil();

class HttpUtil {
  static final _instance = HttpUtil.create();
  late Dio _dio;
  factory HttpUtil() {
    return _instance;
  }
  // HttpUtil() {
  //   init();
  // }
  HttpUtil.create() {
    init();
  }

  init() {
    _dio = Dio(BaseOptions(
        baseUrl: 'http://dev.yunbaoguan.cn/api',
        connectTimeout: 5 * 1000,
        receiveTimeout: 5 * 1000));
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
    _dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    _dio.interceptors.add(AppInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
  }

  Dio get dio => _dio;
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response ressponse, ResponseInterceptorHandler handler) {
    log('REQUEST[${ressponse.data}]');
    return super.onResponse(ressponse, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('error:${err.type}');
    return super.onError(err, handler);
  }
}

_parseJson(String data) {
  /// 使用compute条件 数据长度大于10k
  /// 经测试发现compute在后台解码json耗时比直接解码慢很多,这里做个估值判断
  if (data.length > 1024 * 10) {
    return compute(_jsonDecode, data);
  } else {
    return jsonDecode(data);
  }
}

/// 将json字符串转为对象类型
/// 必须是顶层函数
_jsonDecode(String response) {
  return jsonDecode(response);
}
