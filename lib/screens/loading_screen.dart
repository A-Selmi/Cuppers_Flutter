import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x30000000),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
