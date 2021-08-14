import 'package:flutter/cupertino.dart';

class DrawerHeaderProvider extends ChangeNotifier {
  String text = 'Login';
  String photo = '';

  void setText(String newText) {
    text = newText;
    notifyListeners();
  }

  void setPhoto(String newPhoto) {
    photo = newPhoto;
    notifyListeners();
  }
}
