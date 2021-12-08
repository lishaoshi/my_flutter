import 'package:flutter/material.dart';
import 'package:my_flutter/pages/initPage/index.dart';
import '../pages/initPage/index.dart';
import 'package:flutter/foundation.dart';

class MyRouterDelegate extends RouterDelegate<String>
    with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _stack = <String>[];

  @override
  Future<void> setNewRoutePath(String configuration) async {
    _stack
      ..clear()
      ..add(configuration);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (_stack.isNotEmpty) {
      if (_stack.last == route.settings.name) {
        _stack.remove(route.settings.name);
        notifyListeners();
      }
    }
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey, onPopPage: _onPopPage, pages: [...handlerPages()]);
  }

  List<Page<dynamic>> handlerPages() {
    List<Page<dynamic>> pages = [];
    for (var name in _stack) {
      switch (name) {
        case '/':
          pages.add(initPage);
          break;
        default:
      }
    }
    pages.isEmpty ? pages.add(initPage) : pages;
    return pages;
  }
}
