import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/routers/fluro.dart';
import 'package:my_flutter/states/user_info.dart';
import 'package:my_flutter/utils/path_provider.dart';

MaterialPage initPage =
    const MaterialPage(key: ValueKey('/'), child: InitWidget());

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key}) : super(key: key);
  Future<void> goHome(BuildContext context) async {
    Map<String, dynamic> info = await readProviderUserInfo();
    log('info: ${info}');
    Timer(const Duration(seconds: 2), () {
      if (info['name'] != null && info['name'].toString().isNotEmpty) {
        RouterManage.router!.navigateTo(context, "/home", clearStack: true);
        context.read<UserInfoBloc>().add(UserInfoChange(
            state: UserInfoState(name: info['name'].toString())));
      } else {
        RouterManage.router!.navigateTo(context, "/login", clearStack: true);
      }
    });
  }

  // 读取用户信息
  Future<Map<String, dynamic>> readProviderUserInfo() async {
    FileManege fileManage = FileManege();
    var data = await fileManage.readUserInfo();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    goHome(context);
    return BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('欢迎来到flutter世界'),
              ),
            ));
  }
}
