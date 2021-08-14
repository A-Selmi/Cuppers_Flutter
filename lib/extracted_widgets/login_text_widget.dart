import 'package:flutter/material.dart';

import '../constants.dart';

class LoginTextWidget extends StatelessWidget {
  LoginTextWidget({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: kNormalTextStyle,
      ),
    );
  }
}
