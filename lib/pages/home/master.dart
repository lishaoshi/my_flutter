import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/states/user_info.dart';
import '../user-info/index.dart';
import '../infomation/index.dart';
// import 'package:flutter/services.dart';
import 'index.dart';
import '../animation/index.dart';
import 'package:my_flutter/widgets/app_bar/index.dart';

class PageFragment {
  final AppBar? appBar;
  final WidgetBuilder child;
  final Widget icon;
  final Widget? selectIcon;
  final String label;
  PageFragment(
      {required this.child,
      required this.icon,
      required this.label,
      this.appBar,
      this.selectIcon});
}

class Master extends StatefulWidget {
  final List<PageFragment> pageFragments;
  final PageController pageController;
  const Master(
      {Key? key, required this.pageFragments, required this.pageController})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  int _index = 0;
  void _setIndex(index, [bool? needJump]) {
    setState(() {
      _index = index;
      if (needJump ?? false) {
        widget.pageController.jumpToPage(
          index,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Icon(Icons.double_arrow_sharp),
      appBar: widget.pageFragments[_index].appBar ??
          AppBar(
            title: const Text('default app bar'),
          ),
      body: PageView(
        onPageChanged: _setIndex,
        controller: widget.pageController,
        children: widget.pageFragments.map((p) => p.child(context)).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => _setIndex(index, true),
        type: BottomNavigationBarType.fixed,
        items: widget.pageFragments
            .map((p) => BottomNavigationBarItem(icon: p.icon, label: p.label))
            .toList(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController;
  _MyHomePageState() : pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
      return Master(
        pageFragments: [
          PageFragment(
              child: (context) => HomePage(pageController: pageController),
              icon: const Icon(Icons.emoji_emotions),
              appBar: MusicAppbar.homeAppBar,
              label: '文章列表'),
          PageFragment(
              child: (context) => const UserInfo(),
              icon: const Icon(Icons.person_remove_alt_1_rounded),
              label: '用户信息'),
          PageFragment(
              child: (context) => const Infomation(),
              icon: const Icon(Icons.person_remove_alt_1_rounded),
              label: '动态'),
          PageFragment(
              child: (context) => const MyAnimate(),
              icon: const Icon(Icons.animation),
              label: '动画')
        ],
        pageController: pageController,
      );
    });
  }
}
