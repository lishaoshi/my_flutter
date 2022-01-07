class HomeRecommendModule {
  final int code;
  late final List<HomeRecommendItem> data;

  HomeRecommendModule({required this.code, required List<dynamic> data}) {
    this.data = data
        .map((e) => HomeRecommendItem(name: e['name'], iconUrl: e['iconUrl']))
        .toList();
  }

  factory HomeRecommendModule.fromJSON(dynamic json) {
    return HomeRecommendModule(code: json['code'], data: json['data']);
  }
}

class HomeRecommendItem {
  final String name;
  final String iconUrl;
  HomeRecommendItem({required this.name, required this.iconUrl});
}
