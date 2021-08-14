import 'package:cuppers_flutter/drawer_data.dart';
import 'package:cuppers_flutter/drawer_header_provider.dart';
import 'package:cuppers_flutter/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var drawerHeaderProvider = Provider.of<DrawerHeaderProvider>(context);
    var listData = Provider.of<DrawerData>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (_auth.currentUser == null) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, LoginScreen.id).then((value) {
                      if (_auth.currentUser != null) {
                        drawerHeaderProvider
                            .setText(_auth.currentUser.displayName);
                        drawerHeaderProvider
                            .setPhoto(_auth.currentUser.photoURL);
                      }
                    });
                  } else {
                    listData.setIndex(1);
                    Navigator.pop(context);
                  }
                },
                child: ClipRRect(
                  child: drawerHeaderProvider.photo == ''
                      ? Image.asset(
                          'images/default_profile_picture.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          drawerHeaderProvider.photo,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_auth.currentUser == null) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, LoginScreen.id).then((value) {
                      if (_auth.currentUser != null) {
                        drawerHeaderProvider
                            .setText(_auth.currentUser.displayName);
                        drawerHeaderProvider
                            .setPhoto(_auth.currentUser.photoURL);
                      }
                    });
                  } else {
                    listData.setIndex(1);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  drawerHeaderProvider.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
