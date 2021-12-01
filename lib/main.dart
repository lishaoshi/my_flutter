import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pages/login/index.dart' show Login;
import 'package:my_flutter/pages/home/index.dart' as lib;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '岛上码农1',
      theme: ThemeData(
          backgroundColor: const Color(0xFFFFFFFF), primarySwatch: Colors.blue),
      home: const MyHomePage(
        title: 'hello flutter',
      ),
      routes: {'/login': (context) => const Login()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title = 'home'}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  final List<Widget> _homePages = [
    const HomePage(title: 'home1'),
    const HomePage(title: 'lss'),
    const HomePage(title: 'red')
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
                ))
          ],
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _setIndex(index);
            // Navigator.pushNamed(context, '/login');
          },
        ));
  }
}
