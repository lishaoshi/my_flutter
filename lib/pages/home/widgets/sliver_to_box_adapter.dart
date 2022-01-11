import 'package:flutter/material.dart';

class AppSliverToBoxAdapter extends StatelessWidget {
  final double height;
  final Widget child;
  const AppSliverToBoxAdapter(
      {Key? key, required this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }
}
