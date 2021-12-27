import 'package:flutter/material.dart';
import 'package:my_flutter/state/user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/count/index.dart';
import 'routers/fluro.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class PrimarySwatch extends MaterialColor {
  const PrimarySwatch()
      : super(0xFFF44336, const <int, Color>{
          50: Color(0xFFFFEBEE),
          100: Color(0xFFFFCDD2),
          200: Color(0xFFEF9A9A),
          300: Color(0xFFE57373),
          400: Color(0xFFEF5350),
          500: Color(0xFFF44336),
          600: Color(0xFFE53935),
          700: Color(0xFFD32F2F),
          800: Color(0xFFC62828),
        });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouterManage.initRouter();
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(10),
          ),
          BlocProvider<UserInfoBloc>(
            create: (BuildContext context) => UserInfoBloc(UserInfoState()),
          )
        ],
        child: MaterialApp(
          title: '岛上码农',
          theme: ThemeData(
              fontFamily: 'Georgia',
              backgroundColor: const Color(0xFFFFFFFF),
              primaryColor: Colors.red,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFFFFFFFF),
                  foregroundColor: Colors.black),
              primarySwatch: const PrimarySwatch()),
          onGenerateRoute: RouterManage.router!.generator,
          builder: EasyLoading.init(),
        ));
  }
}
