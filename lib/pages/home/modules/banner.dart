class BannerModuleItem {
  final String pic;
  final int id;
  final String? titleColor;
  final String? typeTitle;

  BannerModuleItem(this.id, this.pic, {this.titleColor, this.typeTitle});

  factory BannerModuleItem.fromJosn(dynamic json) {
    return BannerModuleItem(json['targetId'], json['pic'],
        titleColor: json['titleColor'], typeTitle: json['typeTitle']);
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
