import 'package:flutter/material.dart';
import 'home_app_bar.dart';

class MusicAppbar {
  static final AppBar homeAppBar = AppBar(
    titleSpacing: 0,
    shadowColor: Colors.transparent,
    title: const HomeAppBar(),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
  );
}
