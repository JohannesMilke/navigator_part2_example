import 'package:flutter/material.dart';
import 'package:navigator_part2_example/app_routes.dart';
import 'package:navigator_part2_example/main.dart';
import 'package:navigator_part2_example/page/home/home_arguments.dart';
import 'package:navigator_part2_example/page/login/login_arguments.dart';
import 'package:navigator_part2_example/widget/button_widget.dart';
import 'package:navigator_part2_example/widget/header_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginArguments arguments;

  const LoginPage({
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
            children: [
              HeaderWidget(title: 'Login Page'),
              Text(
                'Username: ${arguments.username}',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
              Text(
                'Password: ${arguments.password}',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Replace: Home (Login)',
                onClicked: () {
                  final args = HomeArguments(userToken: 'MyUserToken');

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                    ModalRoute.withName('/'),
                    arguments: args,
                  );
                },
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Pop: Splash',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
}
