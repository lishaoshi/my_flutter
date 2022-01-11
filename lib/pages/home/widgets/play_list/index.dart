import 'package:flutter/material.dart';
import 'package:my_flutter/widgets/custom_title/index.dart';
import 'package:my_flutter/widgets/custome_button/index.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  List<Map<String, dynamic>> playList = [];
  Widget listBuildFnc(BuildContext contaxt, int index) {
    return PlayListItem(
      url: playList[index]['url'],
      describe: playList[index]['describe'],
    );
  }

  @override
  void initState() {
    super.initState();

    playList = [
      {
        'url':
            'https://p2.music.126.net/k8fxby7gWdUDlK1WjQV7Ng==/109951165598919207.jpg',
        'describe': '描述副书记的看法和计算机款到发货看电视剧复合弓的咖啡馆和豆腐干汇顶科技返回高考大捷发过火'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(
            customLeft: const Text(
              '推荐歌单',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            customRight: CustomeButton(
              title: '更多',
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: listBuildFnc,
            itemCount: playList.length,
          ),
        )
      ],
    );
  }
}

class PlayListItem extends StatelessWidget {
  final String url;
  final String describe;
  const PlayListItem({Key? key, required this.url, required this.describe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              describe,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
