import 'package:flutter/material.dart';

class BannerModuleItem {
  final String pic;
  final int id;
  late final Color? titleColor;
  final String? typeTitle;

  BannerModuleItem(this.id, this.pic, {String? titleBgColor, this.typeTitle}) {
    if (titleBgColor != null) {
      switch (titleBgColor) {
        case 'red':
          titleColor = Colors.red;
          break;
        case 'blue':
          titleColor = Colors.blue;
          break;
        default:
      }
    }
  }

  factory BannerModuleItem.fromJosn(dynamic json) {
    return BannerModuleItem(json['targetId'], json['pic'],
        titleBgColor: json['titleColor'], typeTitle: json['typeTitle']);
  }
}

class BannerModule {
  final int code;
  late final List<BannerModuleItem> banners;

  BannerModule(this.code, List<dynamic> list) {
    banners = list.map((b) => BannerModuleItem.fromJosn(b)).toList();
  }

  factory BannerModule.fromJosn(dynamic json) {
    return BannerModule(json['code'], json['banners']);
  }
}
