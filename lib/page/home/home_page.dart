import 'package:flutter/material.dart';
import 'package:navigator_part2_example/app_routes.dart';
import 'package:navigator_part2_example/main.dart';
import 'package:navigator_part2_example/page/home/home_arguments.dart';
import 'package:navigator_part2_example/widget/button_widget.dart';
import 'package:navigator_part2_example/widget/header_widget.dart';

class HomePage extends StatelessWidget {
  final HomeArguments arguments;

  const HomePage({
    @required this.arguments,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HeaderWidget(title: 'Home Page'),
              Text(
                'UserToken: ${arguments.userToken}',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Replace: Splash (Logout)',
                onClicked: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.splash,
                  ModalRoute.withName('/'),
                ),
              ),
            ],
          ),
        ),
      );
}
