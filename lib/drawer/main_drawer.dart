import 'file:///E:/AndroidStudioProjects/cuppers_flutter/lib/drawer/my_drawer.dart';
import 'package:cuppers_flutter/constants.dart';
import 'package:cuppers_flutter/drawer_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  static String id = 'main_drawer';

  @override
  Widget build(BuildContext context) {
    var listData = Provider.of<DrawerData>(context);
    String fbProtocolUrl = 'fb://page/101753357868997';
    String facebookURL = 'https://www.facebook.com/Cuppersjo';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          title: Text(
            'Cuppers',
            textAlign: TextAlign.center,
          ),
          backgroundColor: kNavigationBarColor,
          elevation: 50,
        ),
        body: listData.list[listData.index],
        drawer: MyDrawer(
          onTap: (context, newIndex) async {
            int lastIndex = listData.index;
            listData.setIndex(newIndex);
            Navigator.pop(context);
            if (newIndex == 6) {
              try {
                bool launched =
                    await launch(fbProtocolUrl, forceSafariVC: false);
                if (!launched) {
                  if (await canLaunch(facebookURL)) await launch(facebookURL);
                }
                listData.setIndex(lastIndex);
              } catch (e) {
                if (await canLaunch(facebookURL)) {
                  await launch(facebookURL);
                }
                listData.setIndex(lastIndex);
              }
            }
          },
        ),
      ),
    );
  }
}
