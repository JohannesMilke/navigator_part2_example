import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Text(
          title,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      );
}
