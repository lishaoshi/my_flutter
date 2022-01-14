import 'package:fluro/fluro.dart';
import '../pages/initPage/index.dart';
import '../pages/login/index.dart';
import '../pages/home/master.dart';
import '../pages/search/index.dart';

class RouterManage {
  static String welcomePage = '/';
  static String homePage = '/home';

  static FluroRouter? router;

  static get context => null;

  static void initRouter() {
    if (router == null) {
      router = FluroRouter();
      defineRoutes();
    }
  }

  static var welcomePageHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const InitWidget();
  });

  static var loginHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const Login();
  });

  static var homeHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const MyHomePage(
      title: 'hello flutter',
    );
  });

  // 搜索页面
  static var searchHandler = Handler(handlerFunc: (context, params) {
    return SearchPage();
  });

  static defineRoutes() {
    router!.define(welcomePage, handler: welcomePageHandler);
    router!.define('/login', handler: loginHandler);
    router!.define('/home', handler: homeHandler);
    router!.define('/search', handler: searchHandler);
  }
}
