import 'package:cuppers_flutter/constants.dart';
import 'package:cuppers_flutter/drawer_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({this.onTap, this.iconData, this.text, this.index});

  final Function onTap;
  final IconData iconData;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    var listData = Provider.of<DrawerData>(context);

    return ListTileTheme(
      textColor: Colors.black,
      iconColor: Colors.black,
      selectedTileColor: kNavigationBarColor,
      selectedColor: Colors.white,
      dense: true,
      style: ListTileStyle.drawer,
      child: ListTile(
        selected: listData.index == index ? true : false,
        leading: Icon(iconData),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
