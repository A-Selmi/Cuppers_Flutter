import 'package:flutter/material.dart';

import '../constants.dart';

class LoginTextFieldWidget extends StatelessWidget {
  LoginTextFieldWidget({
    this.text,
    this.textInputType,
    this.maxLength,
    this.textEditingController,
    this.empty,
    this.obscureValue,
  });

  final String text;
  final TextInputType textInputType;
  final int maxLength;
  final TextEditingController textEditingController;
  final bool empty;
  final bool obscureValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Container(
        width: 260.0,
        child: TextField(
          controller: textEditingController,
          keyboardType: textInputType,
          decoration: kTextFieldDecoration.copyWith(
            hintText: text,
            errorText: empty ? 'This field is required!' : null,
            errorStyle: kErrorTextStyle,
          ),
          maxLength: maxLength,
          obscureText: obscureValue,
        ),
      ),
    );
  }
}
