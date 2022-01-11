import 'dart:developer';

import '../dio_v2.dart';
import 'package:my_flutter/pages/home/modules/banner.dart';
import 'package:my_flutter/pages/home/modules/recommend.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter/modules/basec.dart';

class HomeApi {
  static Future<dynamic> getBanner() async {
    var response = await http.post('/banner?type=1');
    return BannerModule.fromJosn(response.data);
  }

  // /homepage/dragon/ball
  static Future<dynamic> getHomeRecommend() async {
    var response = await http.post('/homepage/dragon/ball');
    return HomeRecommendModule(
        code: response.data['code'], data: response.data['data']);
  }

  static Future<GenericResult> getHomeData() async {
    Response response = await http.get('/homepage/block/page');
    return GenericResult.fromJson(response.data);
  }
}
