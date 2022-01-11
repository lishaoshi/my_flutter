import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  CustomeButton({Key? key, required this.title}) : super(key: key);

  List<Widget> uiList = [
    const Text('更多',
        textAlign: TextAlign.right, style: TextStyle(fontSize: 10)),
    const Icon(
      Icons.arrow_forward_ios,
      size: 10,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {},
        child: Container(
            width: 50,
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: uiList,
            )),
      ),
    );
  }
}
