class PlayListModel {
  final String title;
  final String moreTitle;
  late final List<ResourceItem> resource;
  PlayListModel(
      {required this.title,
      required this.moreTitle,
      required List<dynamic> resource}) {
    this.resource =
        resource.where((element) => element['creativeType'] == 'list').map((e) {
      var uiEle = e['uiElement'];
      return ResourceItem(
          id: e['creativeId'],
          imgUrl: uiEle['image']['imageUrl'],
          describe: uiEle['mainTitle']['title']);
    }).toList();
  }

  factory PlayListModel.fromJson(dynamic json) {
    var uiElement = json['uiElement'];
    return PlayListModel(
        title: uiElement['subTitle']['title'],
        moreTitle: uiElement['button']['text'],
        resource: json['creatives']);
  }
}

class ResourceItem {
  final String id;
  final String imgUrl;
  final String describe;
  ResourceItem(
      {required this.id, required this.imgUrl, required this.describe});

  factory ResourceItem.fromJson(dynamic json) {
    return ResourceItem(
        id: json['createId'], imgUrl: json['url'], describe: json['describe']);
  }
}
