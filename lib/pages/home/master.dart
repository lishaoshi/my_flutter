import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/state/user_info.dart';
import '../user-info/index.dart';
import '../infomation/index.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pages/home/index.dart' as lib;
import 'package:my_flutter/state/user_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 1;
  final List<Widget> _homePages = [
    const lib.HomePage(),
    const Infomation(),
    const UserInfo()
  ];

  void _setIndex(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
              title: Text(state.name ?? ''),
              systemOverlayStyle: SystemUiOverlayStyle.light),
          body: IndexedStack(
            index: _index,
            children: _homePages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  label: 'home',
                  icon: Image.asset(
                    'assets/home.png',
                    width: 32,
                    height: 28,
                  ),
                  activeIcon: Image.asset(
                    'assets/home-select.png',
                    width: 32,
                    height: 28,
                  )),
              BottomNavigationBarItem(
                  label: 'home',
                  icon: Image.asset(
                    'assets/home.png',
                    width: 32,
                    height: 28,
                  ),
                  activeIcon: Image.asset(
                    'assets/home-select.png',
                    width: 32,
                    height: 28,
                  )),
              BottomNavigationBarItem(
                  label: '个人信息',
                  icon: Image.asset(
                    'assets/home.png',
                    width: 32,
                    height: 28,
                  ),
                  activeIcon: Image.asset(
                    'assets/home-select.png',
                    width: 32,
                    height: 28,
                  ))
            ],
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _setIndex(index);
              // Navigator.pushNamed(context, '/login');
            },
          ));
    });
  }
}
