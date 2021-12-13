import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'love_animation.dart';
import 'windmill_indicator.dart';

class MyAnimate extends StatefulWidget {
  const MyAnimate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimate> {
  final String txtKit = 'hello flutter';

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TextLiquidFill(
        text: 'hello',
        waveColor: Colors.blue[400]!,
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
      WindmillIndicator()
    ]);
  }
}
