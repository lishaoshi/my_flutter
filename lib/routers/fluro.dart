import 'package:fluro/fluro.dart';
import '../pages/initPage/index.dart';
import '../pages/login/index.dart';
import '../pages/home/master.dart';

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
    return MyHomePage(
      title: 'hello flutter',
    );
  });

  static defineRoutes() {
    router!.define(welcomePage, handler: welcomePageHandler);
    router!.define('/login', handler: loginHandler);
    router!.define('/home', handler: homeHandler);
  }
}
