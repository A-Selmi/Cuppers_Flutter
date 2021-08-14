import 'package:cuppers_flutter/constants.dart';
import 'package:cuppers_flutter/drawer_data.dart';
import 'package:cuppers_flutter/drawer_header_provider.dart';
import 'package:cuppers_flutter/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../extracted_widgets/drawer_header_widget.dart';
import '../extracted_widgets/list_tile_widget.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final bool developerState = false;

  @override
  Widget build(BuildContext context) {
    var listData = Provider.of<DrawerData>(context);
    var drawerHeaderProvider = Provider.of<DrawerHeaderProvider>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: DrawerHeaderWidget(),
                decoration: BoxDecoration(
                  color: kNavigationBarColor,
                ),
              ),
              ListTileWidget(
                text: 'Home',
                iconData: Icons.home,
                onTap: () => onTap(context, 0),
                index: 0,
              ),
              ListTileWidget(
                text: 'Profile',
                iconData: Icons.account_circle,
                onTap: () => onTap(context, 1),
                index: 1,
              ),
              ListTileWidget(
                text: 'Favorite',
                iconData: Icons.favorite,
                onTap: () => onTap(context, 2),
                index: 2,
              ),
              ListTileWidget(
                text: 'Cart',
                iconData: Icons.shopping_cart,
                onTap: () => onTap(context, 3),
                index: 3,
              ),
              ListTileWidget(
                text: 'Your Orders',
                iconData: Icons.playlist_add_check,
                onTap: () => onTap(context, 4),
                index: 4,
              ),
              ListTileWidget(
                text: 'Your Credit Cards',
                iconData: Icons.credit_card,
                onTap: () => onTap(context, 5),
                index: 5,
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTileWidget(
                text: 'Facebook Page',
                iconData: Icons.phone_android,
                onTap: () => onTap(context, 6),
                index: 6,
              ),
              Visibility(
                visible: developerState && _auth.currentUser != null,
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Visibility(
                visible: developerState && _auth.currentUser != null,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Developer Setting'),
                ),
              ),
              Visibility(
                visible: developerState && _auth.currentUser != null,
                child: ListTileWidget(
                  text: 'Customers Orders',
                  iconData: Icons.view_list_rounded,
                  onTap: () => onTap(context, 7),
                  index: 7,
                ),
              ),
              Visibility(
                visible: developerState && _auth.currentUser != null,
                child: ListTileWidget(
                  text: 'Manage',
                  iconData: Icons.settings,
                  onTap: () => onTap(context, 8),
                  index: 8,
                ),
              ),
              Visibility(
                visible: developerState && _auth.currentUser != null,
                child: ListTileWidget(
                  text: 'Statistics',
                  iconData: Icons.table_view,
                  onTap: () => onTap(context, 9),
                  index: 9,
                ),
              ),
              Visibility(
                visible: _auth.currentUser != null,
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Visibility(
                visible: _auth.currentUser != null,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 4.0,
                  ),
                  child: ListTileWidget(
                    text: 'Logout',
                    iconData: Icons.logout,
                    onTap: () async {
                      await GoogleSignIn().signOut();
                      await _auth.signOut();
                      await SharedPreferencesClass().setLoginState(false);
                      drawerHeaderProvider.setText('Login');
                      drawerHeaderProvider.setPhoto('');
                      listData.setIndex(0);
                      Navigator.pop(context);
                    },
                    index: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
