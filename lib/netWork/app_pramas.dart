import 'dart:developer';

import 'package:dio/dio.dart';

class AppParams extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // (options.data as Map);
    // // .addAll({
    // //   "appId": "a301020000000000ac22dc8fa20e3795",
    // //   "timestamp": DateTime.now().millisecond,
    // //   "accessToken": "y8f3b107ed962c79ade975991c3cde622c77459eb28d2b14af"
    // // });
    // // options.data['appId'] = 'a301020000000000ac22dc8fa20e3795';
    // log('>>>$options');
    super.onRequest(options, handler);
  }
}
