import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/states/user_info.dart';
import 'package:my_flutter/routers/fluro.dart';
import 'package:my_flutter/utils/path_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  String? errorText;
  String name = '';
  TextEditingController controller = TextEditingController();

  void login(BuildContext context) async {
    if (controller.text.isNotEmpty) {
      context
          .read<UserInfoBloc>()
          .add(UserInfoChange(state: UserInfoState(name: controller.text)));
      FileManege fileMng = FileManege();
      fileMng.writeCounter(UserInfoState(name: controller.text));
      Timer(const Duration(seconds: 1), () {
        RouterManage.router!
            .navigateTo(context, '/home', replace: true, clearStack: true);
      });
    } else {
      setState(() {
        errorText = '请输入用户名';
      });
    }
  }

  @override
  Widget build(BuildContext content) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  controller: controller,
                  obscureText: true,
                  onChanged: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        errorText = '请输入用户名';
                      });
                    } else {
                      setState(() {
                        errorText = null;
                        name = val;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      labelText: '用户名',
                      errorText: errorText,
                      labelStyle: const TextStyle(color: Colors.black45))),
              ElevatedButton(
                onPressed: () => login(context),
                child: Text('登录'),
                style: ButtonStyle(elevation: MaterialStateProperty.all(50)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
