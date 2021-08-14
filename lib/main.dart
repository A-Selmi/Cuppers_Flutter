import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/cart_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/favorite_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/home_screen.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/main_drawer.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/profile_screen.dart';
import 'package:cuppers_flutter/constants.dart';
import 'package:cuppers_flutter/drawer/screens/customers_orders_screen.dart';
import 'package:cuppers_flutter/drawer/screens/manage_screen.dart';
import 'package:cuppers_flutter/drawer/screens/statistics_screen.dart';
import 'package:cuppers_flutter/drawer/screens/your_credit_cards.dart';
import 'package:cuppers_flutter/drawer_data.dart';
import 'package:cuppers_flutter/drawer_header_provider.dart';
import 'package:cuppers_flutter/screens/login_screen.dart';
import 'package:cuppers_flutter/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/screens/your_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kStatusBarColor,
        systemNavigationBarColor: kNavigationBarColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DrawerData()),
        ChangeNotifierProvider(create: (context) => DrawerHeaderProvider()),
      ],
      child: Container(
        decoration: BoxDecoration(gradient: kGradientColor),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: MainDrawer.id,
          routes: {
            MainDrawer.id: (context) => MainDrawer(),
            HomeScreen.id: (context) => HomeScreen(),
            ProfileScreen.id: (context) => ProfileScreen(),
            FavoriteScreen.id: (context) => FavoriteScreen(),
            CartScreen.id: (context) => CartScreen(),
            YourOrdersScreen.id: (context) => YourOrdersScreen(),
            YourCreditCardsScreen.id: (context) => YourCreditCardsScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            CustomersOrdersScreen.id: (context) => CustomersOrdersScreen(),
            ManageScreen.id: (context) => ManageScreen(),
            StatisticsScreen.id: (context) => StatisticsScreen(),
            RegisterScreen.id: (context) => RegisterScreen(),
          },
        ),
      ),
    );
  }
}
