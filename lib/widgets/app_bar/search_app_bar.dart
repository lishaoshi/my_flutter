import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  SearchAppBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchAppBar();
  }
}

class _SearchAppBar extends State<SearchAppBar> {
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        focusNode: focusNode,
      ),
    );
  }
}

// class SearchAppBar extends StatelessWidget {
//   SearchAppBar({Key? key}) : super(key: key);

//   FocusNode? focusNode;

//   @override
//   Widget build(BuildContext context) {
//     focusNode ??= FocusNode();
//     return Container(
//       child: TextField(
//         focusNode: focusNode,
//       ),
//     );
//   }
// }
