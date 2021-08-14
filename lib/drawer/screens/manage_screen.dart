import 'package:flutter/material.dart';

class ManageScreen extends StatelessWidget {
  static String id = 'manage_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(8.0),
          color: Colors.white,
          child: Container(
            child: Center(
              child: Text('Manage Screen'),
            ),
          ),
        ),
      ),
    );
  }
}
