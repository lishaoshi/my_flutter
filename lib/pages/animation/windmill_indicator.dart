// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';

class WindmillIndicator extends StatefulWidget {
  const WindmillIndicator({Key? key}) : super(key: key);

  @override
  State createState() => _WindmillIndicator();
}

class _WindmillIndicator extends State<WindmillIndicator>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 50),
          child: AnimationWindmill(
            animation: animation,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

// 枫叶组件
class WindmillWing extends StatelessWidget {
  final double angle;
  final Color color;
  const WindmillWing({Key? key, required this.angle, required this.color})
      : super(key: key);

  @override
  Widget build(context) {
    return Container(
      transformAlignment: Alignment.bottomCenter,
      transform: Matrix4.translationValues(0, -50 / 2, 0)..rotateZ(angle),
      child: ClipPath(
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          color: color,
        ),
        clipper: WindmillClipPath(),
      ),
    );
  }
}

// 叶片切割组件
class WindmillClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(size.width / 3, size.height)
      ..quadraticBezierTo(0, 0, size.width, 0)
      // ..arcToPoint(Offset(0, size.height * (2 / 3)),
      //     radius: Radius.circular(size.width / 2))
      // ..arcToPoint(Offset(size.width, 0), radius: Radius.circular(size.width))
      ..lineTo(size.width / 3, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// 风车动画组件

class AnimationWindmill extends AnimatedWidget {
  final Animation<double> animation;
  AnimationWindmill({Key? key, required this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // final animated = listenable as Animation<double>;
    final rotationAngle = 2 * pi * animation.value;
    return Stack(
      children: <Widget>[
        WindmillWing(
          angle: rotationAngle,
          color: Colors.yellow,
        ),
        WindmillWing(
          angle: pi / 2 + rotationAngle,
          color: Colors.green,
        ),
        WindmillWing(
          angle: pi + rotationAngle,
          color: Colors.red,
        ),
        WindmillWing(
          angle: -pi / 2 + rotationAngle,
          color: Colors.blue,
        )
      ],
    );
  }
}
