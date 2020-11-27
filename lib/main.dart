import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigator_part2_example/app_routes.dart';
import 'package:navigator_part2_example/page/home/home_arguments.dart';
import 'package:navigator_part2_example/page/home/home_page.dart';
import 'package:navigator_part2_example/page/login/login_arguments.dart';
import 'package:navigator_part2_example/page/login/login_page.dart';
import 'package:navigator_part2_example/page/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigator 1.0';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: getInitialRoute(),
        onGenerateRoute: (route) => getRoute(route),
      );

  String getInitialRoute() => AppRoutes.splash;

  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(SplashPage(), settings: settings);
      case AppRoutes.login:
        // Arguments are mandatory
        final LoginArguments args = settings.arguments;

        return args == null
            ? throw Exception('Error: No Login Arguments')
            : buildRoute(LoginPage(arguments: args), settings: settings);
      case AppRoutes.home:
        // Arguments are not mandatory => we set some default arguments
        final defaultArgs = HomeArguments(userToken: null);
        final HomeArguments args = settings.arguments ?? defaultArgs;

        return buildRoute(HomePage(arguments: args), settings: settings);
      default:
        return null;
    }
  }

  MaterialPageRoute buildRoute(Widget child, {RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => child,
      );
}
