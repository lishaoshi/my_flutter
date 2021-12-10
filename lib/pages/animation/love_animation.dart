import 'dart:developer';

import 'package:flutter/material.dart';

class LoveAnimation extends StatefulWidget {
  const LoveAnimation({Key? key}) : super(key: key);

  @override
  State createState() => _LoveAnimation();
}

class _LoveAnimation extends State<LoveAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 40, end: 100).animate(controller)
      ..addListener(() {
        if (controller.isCompleted) {
          controller.reverse();
        } else if (controller.isDismissed) {
          controller.forward();
        }
        setState(() {});
      });
    if (mounted) {
      controller.forward();
    }
  }

  animationToggle() {
    if (!controller.isAnimating) {
      if (controller.status == AnimationStatus.reverse) {
        controller.reverse();
      } else if (controller.status == AnimationStatus.forward) {
        controller.forward();
      }
    } else {
      controller.stop();
    }
    // controller.isAnimating
  }

  @override
  Widget build(BuildContext context) {
    // if (mounted) {
    //   Future.delayed(Duration(milliseconds: 500), () {
    //     controller.forward();
    //   });
    // }
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Stack(
              alignment: Alignment(0, 0),
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red[100],
                  size: animation.value * 2,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red[400],
                  size: animation.value,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red[600],
                  size: animation.value * 0.5,
                )
              ],
            ),
          ),
          TextButton(
              onPressed: animationToggle,
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
