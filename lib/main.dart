import 'package:flutter/material.dart';

import 'package:my_flutter/state/user_info.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/count/index.dart';
import 'routers/fluro.dart';

void main() {
  runApp(const MyApp());
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
              primarySwatch: Colors.blue),
          onGenerateRoute: RouterManage.router!.generator,
        ));
  }
}
