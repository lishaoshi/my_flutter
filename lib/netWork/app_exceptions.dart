import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppException implements Exception {
  final String msg;
  final int code;

  AppException(this.msg, this.code);

  @override
  String toString() {
    return "exception is code:$code, massage:$msg";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException('请求取消', -1);
      case DioErrorType.connectTimeout:
        return BadRequestException('连接超时', -1);
      case DioErrorType.sendTimeout:
        return BadRequestException('请求超时', -1);
      case DioErrorType.receiveTimeout:
        return BadRequestException('响应超时', -1);
      case DioErrorType.response:
        int code = error.response!.statusCode ?? 0;
        switch (code) {
          case 400:
            return BadRequestException('参数错误', code);
          case 401:
            return UnauthorisedException('没有权限', code);
          case 403:
            return UnauthorisedException('服务器拒绝执行', code);
          case 404:
            return UnauthorisedException("无法连接服务器", code);
          case 405:
            return UnauthorisedException("请求方法被禁止", code);
          case 500:
            return UnauthorisedException('服务器内部错误', code);
          case 502:
            return UnauthorisedException("无效的请求", code);
          case 503:
            return UnauthorisedException("服务器挂了", code);
          case 505:
            return UnauthorisedException("不支持HTTP协议请求", code);
          default:
            return AppException('未知异常', code);
        }
      default:
        return AppException('未知异常', 600);
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException(String msg, int code) : super(msg, code);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException(String msg, int code) : super(msg, code);
}
