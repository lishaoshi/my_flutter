import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter/routers/fluro.dart';

MaterialPage initPage =
    const MaterialPage(key: ValueKey('/'), child: InitWidget());

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key}) : super(key: key);
  Future<void> goHome(context) async {
    Timer(const Duration(seconds: 2), () {
      RouterManage.router!.navigateTo(context, "/login", clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    goHome(context);
    return const Scaffold(
      body: Center(
        child: Text('欢迎来到flutter世界'),
      ),
    );
  }
}
