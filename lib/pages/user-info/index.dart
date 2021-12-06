import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
          _header(),
          cartItem(context, '金融理财'),
        ]),
        backgroundColor: Colors.white54);
  }

  Widget _header() {
    return Container(
        height: 144,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF56AF6D),
                  Color(0xFF56AA6D),
                ]),
            borderRadius: BorderRadius.circular(4.0)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconMenu(
                  const Icon(
                    Icons.copy_rounded,
                    color: Colors.white,
                  ),
                  '收付款'),
              iconMenu(
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                  ),
                  '钱包',
                  money: const Text(
                    '2021.5',
                    style: TextStyle(color: Colors.white70),
                  )),
            ],
          ),
        ));
  }
}

Widget iconMenu(Icon icon, String title, {Widget? money}) {
  List<Widget> widgets = money != null
      ? [
          icon,
          Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          money
        ]
      : [
          icon,
          Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )
        ];
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
}

Widget cartItem(BuildContext context, String title) {
  double margin = 10;
  double padding = 10;

  return Container(
    margin: EdgeInsets.all(margin),
    padding: EdgeInsets.all(padding),
    decoration: const BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(color: Colors.black38),
        ),
        GridView.count(
            crossAxisCount: 3, //设置以下两个参数，禁止GridView的滚动，防止与 ListView 冲突
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              iconMenu(const Icon(Icons.access_time_outlined), '信用卡还款'),
              iconMenu(
                const Icon(
                  Icons.access_time_outlined,
                ),
                '信用卡还款',
              )
            ])
      ],
    ),
  );
}
