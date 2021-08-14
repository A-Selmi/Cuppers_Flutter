import 'package:flutter/material.dart';

const kGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    kDarkAppColor,
    kLightAppColor,
    kDarkAppColor,
  ],
  stops: [
    0.1,
    0.5,
    0.9,
  ],
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.w400,
);

const kNormalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
);

const kErrorTextStyle = TextStyle(
  color: Colors.red,
  fontSize: 15.0,
);

const kClickableTextStyle = TextStyle(
  color: kBlueColor,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kLightAppColor = Color(0xFFE5BB8D);
const kDarkAppColor = Color(0xFFa37351);
const kStatusBarColor = Color(0xDDeac8a3);
const kNavigationBarColor = Color(0xAAE5BB8D);
const kBlueColor = Color(0xff0675E8);
