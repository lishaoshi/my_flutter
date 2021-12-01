import 'package:flutter/material.dart';
import 'package:my_flutter/mock/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 1;
  int pageSize = 10;
  List<Map<String, Object>> list = [];
  _HomePageState() : super() {
    _getList();
  }

  void _getList() async {
    List<Map<String, Object>> data = await HomeMock.list(pageNo: 1, size: 10);
    setState(() {
      if (pageNo > 1) {
        list.addAll(data);
      } else {
        list = data;
      }
    });
  }

  void _refresh() {
    setState(() {
      pageNo = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (content, index) =>
              ListItem(url: list[index]['imgUrl']?.toString() ?? '')),
    );
  }
}

class ListItem extends StatelessWidget {
  final String url;
  const ListItem({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[imageBox()]);
  }

  Widget imageBox() => SizedBox(
        height: 100,
        child: Text(url),
      );
}
