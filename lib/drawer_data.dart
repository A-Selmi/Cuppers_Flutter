import 'dart:collection';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/cart_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/favorite_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/home_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/your_credit_cards.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/profile_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/your_orders_screen.dart';
import 'package:cuppers_flutter/drawer/screens/customers_orders_screen.dart';
import 'package:cuppers_flutter/drawer/screens/manage_screen.dart';
import 'package:cuppers_flutter/drawer/screens/statistics_screen.dart';
import 'package:cuppers_flutter/screens/loading_screen.dart';
import 'package:flutter/cupertino.dart';

class DrawerData extends ChangeNotifier {
  int index = 0;
  List<Widget> _list = [
    HomeScreen(),
    ProfileScreen(),
    FavoriteScreen(),
    CartScreen(),
    YourOrdersScreen(),
    YourCreditCardsScreen(),
    LoadingScreen(),
    CustomersOrdersScreen(),
    ManageScreen(),
    StatisticsScreen(),
    HomeScreen(),
  ];

  void setIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  UnmodifiableListView<Widget> get list {
    return UnmodifiableListView(_list);
  }
}
