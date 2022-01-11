import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/netWork/api/home.dart';
import '../modules/recommend.dart';

class HomeRecommend extends StatefulWidget {
  final PageController pageController;
  const HomeRecommend({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeRecommentd();
}

class _HomeRecommentd extends State<HomeRecommend> {
  List<HomeRecommendItem> recommends = [];

  ScrollController controller = ScrollController();

  Future<void> getData() async {
    HomeRecommendModule result = await HomeApi.getHomeRecommend();
    if (mounted) {
      setState(() {
        recommends = result.data;
      });
    }
  }

  DragStartDetails? dragStartDetails;
  Drag? drag;

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification) {
      dragStartDetails = notification.dragDetails!;
    }
    if (notification is UserScrollNotification &&
        controller.offset == notification.metrics.maxScrollExtent) {
      widget.pageController.position.drag(dragStartDetails!, () {});
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return recommends.isNotEmpty
        ? NotificationListener(
            onNotification: _onNotification,
            child: GridView.count(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: recommends
                  .map((r) => RecommendItem(
                        iconUrl: r.iconUrl,
                        name: r.name,
                      ))
                  .toList(),
            ))
        : Container();
  }
}

class RecommendItem extends StatelessWidget {
  final String iconUrl;
  final String name;
  const RecommendItem({Key? key, required this.iconUrl, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
                image: DecorationImage(
                  image: NetworkImage(iconUrl),
                )),
            child: Image.network(iconUrl),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
