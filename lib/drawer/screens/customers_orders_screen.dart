import 'package:flutter/material.dart';

class CustomersOrdersScreen extends StatelessWidget {
  static String id = 'customers_orders_screen';
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
              child: Text('Customers Orders Screen'),
            ),
          ),
        ),
      ),
    );
  }
}
