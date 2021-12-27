import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter/netWork/app_exceptions.dart';

typedef BuilderHand = Widget Function(BuildContext, AsyncSnapshot);

class AppFutrueBuilder extends StatefulWidget {
  final Widget child;
  final Future future;
  final dynamic initialData;

  const AppFutrueBuilder(
      {Key? key, required this.child, required this.future, this.initialData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppFutrueBuilder();
}

class _AppFutrueBuilder extends State<AppFutrueBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: widget.key,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          EasyLoading.show();
          return Container();
        } else if (snapshot.hasError) {
          EasyLoading.dismiss();
          return Text('${((snapshot.error as DioError).error)}');
        } else if (snapshot.hasData) {
          EasyLoading.dismiss();
          return widget.child;
        } else {
          return Container();
        }
      },
      initialData: widget.initialData,
      future: widget.future,
    );
  }
}
