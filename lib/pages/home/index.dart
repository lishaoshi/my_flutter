import 'package:flutter/material.dart';
import 'package:my_flutter/mock/home.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 1;
  int pageSize = 10;
  List<Map<String, Object>> list = [];
  _HomePageState() : super();

  @override
  void initState() {
    super.initState();
    _getList();
  }

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
    setState(() {
      pageNo = 1;
    });
    _getList();
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
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return ListItem(
              url: list[index]['imageUrl'].toString(),
              title: list[index]['title']?.toString(),
            );
          }, childCount: list.length))
        ],
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
          fadeInDuration: Duration(seconds: 5),
          placeholder: (content, url) => Image.asset('assets/load-error.png'),
        ),
      );

  Widget titleView(context) => Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text('$title', style: const TextStyle(color: Colors.black54)),
      );
  Widget _viewCount() => Container(
        margin: EdgeInsets.only(left: 10),
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
