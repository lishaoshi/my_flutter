import 'package:flutter/material.dart';
import 'package:my_flutter/mock/home.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'widgets/banner.dart';
import 'widgets/recommend.dart';
import 'widgets/play_list/index.dart';
import 'package:my_flutter/netWork/api/home.dart';
import 'modules/index.dart';
import 'widgets/sliver_to_box_adapter.dart';

enum ShowType { banner }

class HomePage extends StatefulWidget {
  final PageController pageController;
  const HomePage({Key? key, required this.pageController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  _HomePageState() : super();

  int pageNo = 1;
  int pageSize = 10;
  List<Map<String, Object>> list = [];

  List? blocks;
  List<Widget> renderUIs = [];

  @override
  void initState() {
    super.initState();
    _getHomeData();
  }

  @override
  bool get wantKeepAlive => true;

  void _getList() async {
    List<Map<String, Object>> data =
        await HomeMock.list(pageNo: pageNo, size: pageSize);
    setState(() {
      if (pageNo > 1) {
        list.addAll(data);
      } else {
        list = data;
      }
    });
  }

  Future<void> _onRefresh() async {
    _getHomeData();
  }

  Future<void> _getHomeData() async {
    var result = await HomeApi.getHomeData();
    if (mounted) {
      setState(() {
        blocks = result.data['blocks'];
        blocks!.insert(1, {'showType': 'BALLLIST'});
      });
    }
    // BannerModule banners = result
  }

  List<Widget> _renderBlocks() {
    if (blocks != null) {
      return blocks!.map((element) {
        if (element['showType'] == 'BANNER') {
          return AppSliverToBoxAdapter(
              height: 140,
              child: HomeBanner(banners: element['extInfo']['banners']));
        } else if (element['showType'] == 'BALLLIST') {
          return AppSliverToBoxAdapter(
              height: 60,
              child: HomeRecommend(pageController: widget.pageController));
        } else if (element['showType'] == 'HOMEPAGE_SLIDE_PLAYLIST') {
          return const AppSliverToBoxAdapter(
            height: 200,
            child: PlayList(),
          );
        } else {
          return const AppSliverToBoxAdapter(height: 10, child: Text('11'));
        }
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: _onRefresh,
        onLoad: () async {
          setState(() {
            pageNo++;
          });
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              _getList();
            }
          });
        },
        slivers: _renderBlocks(),
        // slivers: [
        //   // const SliverToBoxAdapter(
        //   //   child: SizedBox(height: 140, child: HomeBanner()),
        //   // ),
        //   // SliverToBoxAdapter(
        //   //   child: SizedBox(
        //   //     height: 60,
        //   //     child: HomeRecommend(pageController: widget.pageController),
        //   //   ),
        //   // ),
        //   // const SliverToBoxAdapter(
        //   //   child: SizedBox(
        //   //     height: 200,
        //   //     child: PlayList(),
        //   //   ),
        //   // ),
        //   // SliverList(
        //   //     delegate: SliverChildBuilderDelegate((context, index) {
        //   //   return ListItem(
        //   //     url: list[index]['imageUrl'].toString(),
        //   //     title: list[index]['title']?.toString(),
        //   //   );
        //   // }, childCount: list.length))
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String url;
  final String? title;
  const ListItem({Key? key, required this.url, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imageBox(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [titleView(context), _viewCount()],
          ))
        ],
      ),
    );
  }

  Widget imageBox() => SizedBox(
        height: 100,
        width: 150,
        child: CachedNetworkImage(
          imageUrl: url,
          fadeInDuration: const Duration(seconds: 5),
          placeholder: (content, url) => Image.asset('assets/load-error.png'),
        ),
      );

  Widget titleView(context) => Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text('$title', style: const TextStyle(color: Colors.black54)),
      );
  Widget _viewCount() => Container(
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          children: const <Widget>[
            Icon(
              Icons.remove_red_eye_outlined,
              size: 14.0,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'hello  this is ocunt',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ],
        ),
      );
}
