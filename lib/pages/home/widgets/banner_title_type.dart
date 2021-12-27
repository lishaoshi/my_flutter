import 'package:flutter/material.dart';

class TitleType extends StatelessWidget {
  final String title;
  final String? color;
  const TitleType(this.title, {Key? key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.red),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ));
  }
}
