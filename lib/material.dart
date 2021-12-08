import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pages/home/index.dart' as lib;
import 'pages/user-info/index.dart';
import 'pages/infomation/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/count/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 1;
  final List<BottomNavigationBarItem> _bottomTabWidget = [
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
  ];
  CounterBloc counterBloc = CounterBloc(10);
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
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            systemOverlayStyle: SystemUiOverlayStyle.light),
        body: BlocBuilder<CounterBloc, int>(
            builder: (context, state) => Center(
                  child: Column(
                    children: [
                      Text('$state'),
                      TextButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementEvent());
                          },
                          child: Text('增加'))
                    ],
                  ),
                )),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomTabWidget,
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _setIndex(index);
            // Navigator.pushNamed(context, '/login');
          },
        ));
  }
}
