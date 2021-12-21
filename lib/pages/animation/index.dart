import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'love_animation.dart';
import 'windmill_indicator.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_flutter/netWork/dio.dart';
import 'package:dio/dio.dart';

class MyAnimate extends StatefulWidget {
  const MyAnimate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimate> {
  final String txtKit = 'hello flutter';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TextLiquidFill(
        text: 'hello',
        waveColor: Colors.blue[100]!,
        boxBackgroundColor: Colors.redAccent,
        textStyle: const TextStyle(fontSize: 20),
        boxHeight: 100.0,
        loadUntil: 0.7,
      ),
      AnimatedTextKit(animatedTexts: <AnimatedText>[
        WavyAnimatedText(txtKit,
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
                color: Color.fromRGBO(164, 66, 245, 1), fontSize: 30)),
      ], isRepeatingAnimation: true, repeatForever: true),
      LoveAnimation(),
      WindmillIndicator(),
      ElevatedButton(
          onPressed: () async {
            try {
              await http.dio.get('/login');
            } on DioError catch (err) {
              log('error111: ${err.error}');
            }
          },
          child: const Text('dio'))
    ]);
  }
}
