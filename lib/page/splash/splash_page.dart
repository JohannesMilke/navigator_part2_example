import 'package:flutter/material.dart';
import 'package:navigator_part2_example/app_routes.dart';
import 'package:navigator_part2_example/main.dart';
import 'package:navigator_part2_example/page/login/login_arguments.dart';
import 'package:navigator_part2_example/widget/button_widget.dart';
import 'package:navigator_part2_example/widget/header_widget.dart';

class SplashPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HeaderWidget(title: 'Splash Page'),
              ButtonWidget(
                text: 'Push: Login + Data',
                onClicked: () {
                  final args = LoginArguments(
                      username: 'JohannesMilke', password: 'password');

                  Navigator.pushNamed(
                    context,
                    AppRoutes.login,
                    arguments: args,
                  );
                },
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Push: Login + No Data',
                onClicked: () async {
                  try {
                    await Navigator.pushNamed(context, AppRoutes.login);
                  } catch (e) {
                    scaffoldKey.currentState
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content:
                              Text('Expected Error: Login Route needs data'),
                        ),
                      );
                  }
                },
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Replace: Home (Guest)',
                onClicked: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  ModalRoute.withName('/'),
                ),
              ),
            ],
          ),
        ),
      );
}
