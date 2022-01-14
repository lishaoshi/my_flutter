import 'package:flutter/material.dart';
import 'package:my_flutter/widgets/app_bar/index.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MusicAppbar.searchAppBar,
      body: Text('1'),
    );
  }
}
