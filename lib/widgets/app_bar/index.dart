import 'package:flutter/material.dart';
import 'home_app_bar.dart';

class MusicAppbar {
  static final AppBar homeAppBar = AppBar(
    titleSpacing: 0,
    shadowColor: Colors.transparent,
    title: const HomeAppBar(),
    leadingWidth: 48,
    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.mic_rounded))
    ],
  );
}
