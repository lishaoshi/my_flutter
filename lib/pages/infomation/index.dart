import 'package:flutter/material.dart';
import '../login/index.dart';

class Infomation extends StatefulWidget {
  const Infomation({Key? key}) : super(key: key);

  @override
  State createState() => _InfomationState();
}

class _InfomationState extends State<Infomation> {
  void _onpressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            onPressed: _onpressed,
            child: Text('登录')),
      ),
    );
  }
}
