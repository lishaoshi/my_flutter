import 'dart:developer';

import '../dio_v2.dart';
import 'package:my_flutter/pages/home/modules/banner.dart';
import 'package:my_flutter/pages/home/modules/recommend.dart';

class HomeApi {
  static Future<dynamic> getBanner() async {
    var response = await http.post('/banner?type=1');
    return BannerModule.fromJosn(response.data);
  }

  // /homepage/dragon/ball
  static Future<dynamic> getHomeRecommend() async {
    var response = await http.post('/homepage/dragon/ball');
    log('$response');
    return HomeRecommendModule(
        code: response.data['code'], data: response.data['data']);
  }
}
