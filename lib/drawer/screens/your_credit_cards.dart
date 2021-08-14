import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourCreditCardsScreen extends StatelessWidget {
  static String id = 'your_credit_cards_screen';

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
              child: Text('Your Credit Cards Screen'),
            ),
          ),
        ),
      ),
    );
  }
}
