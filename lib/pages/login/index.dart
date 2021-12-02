import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TextField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.none,
                decoration: InputDecoration(
                    labelText: '请输入',
                    border: OutlineInputBorder(),
                    helperText: '请输入用户名',
                    hintText: 'hintText',
                    labelStyle: TextStyle(color: Colors.black45)))
          ],
        ),
      ),
    );
  }
}
