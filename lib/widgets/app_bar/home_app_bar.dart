import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeAppBar();
}

class _HomeAppBar extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/search');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: const BoxDecoration(
            color: Color(0xFFf4f4f4),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Color(0xFF9c9c9c),
            ),
            Text(
              '新人必听',
              style: TextStyle(fontSize: 16, color: Color(0xFF9c9c9c)),
            )
          ],
        ),
      ),
    );
  }
}
