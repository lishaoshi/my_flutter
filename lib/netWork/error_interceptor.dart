import 'package:dio/dio.dart';
import 'app_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException appException = AppException.create(err);
    err.error = appException;
    super.onError(err, handler);
  }
}

// class BaseError {
//   final DioError errorType;
//   BaseError(this.errorType);
// }
