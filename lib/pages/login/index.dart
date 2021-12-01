import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  String code = '';
  @override
  Widget build(BuildContext content) {
    return Container(
      height: 400,
      width: 20,
      color: Colors.red,
    );
  }
}
