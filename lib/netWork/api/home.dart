import '../dio_v2.dart';
import 'package:my_flutter/pages/home/modules/banner.dart';

class HomeApi {
  static Future<dynamic> getBanner() async {
    var response = await http.post('/banner?type=1');
    return BannerModule.fromJosn(response.data);
  }
}
