import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final Widget customLeft;
  final Widget? customRight;
  final EdgeInsets? padding;
  const CustomTitle(
      {Key? key, required this.customLeft, this.customRight, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [customLeft, if (customRight != null) customRight!],
        ));
  }
}
