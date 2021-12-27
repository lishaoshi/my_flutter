import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'error_interceptor.dart';
import 'app_pramas.dart';

class HttpUtils extends DioForNative {
  HttpUtils() {
    (transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
    _beforInit();
  }

  _beforInit() {
    interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    interceptors.add(AppParams());
    interceptors.add(ErrorInterceptor());
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
