import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pages/login/index.dart' show Login;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '岛上码农',
      theme: ThemeData(
          backgroundColor: const Color(0xFFFFFFFF), primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _index = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times hot1:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
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
            Navigator.pushNamed(context, '/login');
          },
        ));
  }
}
