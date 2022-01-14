import 'package:flutter/material.dart';
import 'package:my_flutter/widgets/custom_title/index.dart';
import 'package:my_flutter/widgets/custome_button/index.dart';
import 'package:my_flutter/pages/home/modules/play_list.dart';

class PlayList extends StatefulWidget {
  late final PlayListModel data;
  PlayList({Key? key, required dynamic data}) : super(key: key) {
    this.data = PlayListModel.fromJson(data);
  }

  @override
  State<StatefulWidget> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  Widget listBuildFnc(BuildContext contaxt, int index) {
    return PlayListItem(
      url: widget.data.resource[index].imgUrl,
      describe: widget.data.resource[index].describe,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(
            customLeft: Text(
              widget.data.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            customRight: CustomeButton(
              title: widget.data.moreTitle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: listBuildFnc,
            itemCount: widget.data.resource.length,
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
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              width: 100,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              describe,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
