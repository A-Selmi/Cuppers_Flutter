import 'dart:ui';

import 'package:cuppers_flutter/constants.dart';
import 'package:cuppers_flutter/drawer_header_provider.dart';
import 'package:cuppers_flutter/extracted_widgets/login_text_field_widget.dart';
import 'package:cuppers_flutter/extracted_widgets/login_text_widget.dart';
import 'package:cuppers_flutter/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _emailErrorMessage = false;
  bool _passwordErrorMessage = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  bool checkEmptyFields() {
    bool state = false;
    setState(() {
      _emailErrorMessage = _emailController.text.trim().isEmpty;
      _passwordErrorMessage = _passwordController.text.trim().isEmpty;
    });

    if (_emailErrorMessage) {
      _emailController.clear();
      state = true;
    }
    if (_passwordErrorMessage) {
      _passwordController.clear();
      state = true;
    }
    return state;
  }

  @override
  Widget build(BuildContext context) {
    var drawerHeaderProvider = Provider.of<DrawerHeaderProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(gradient: kGradientColor),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: Text(
                  'Login',
                  style: kTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginTextWidget(
                              text: 'Email',
                            ),
                            LoginTextFieldWidget(
                              textEditingController: _emailController,
                              text: 'Enter your email',
                              textInputType: TextInputType.emailAddress,
                              empty: _emailErrorMessage,
                              obscureValue: false,
                            ),
                            LoginTextWidget(
                              text: 'Password',
                            ),
                            LoginTextFieldWidget(
                              textEditingController: _passwordController,
                              text: 'Enter your password',
                              maxLength: 30,
                              obscureValue: true,
                              empty: _passwordErrorMessage,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150.0,
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 5.0,
                              ),
                              child: RaisedButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  bool empty = checkEmptyFields();
                                  //TODO login the user if exist
                                  //TODO go back to the main screen
                                },
                                child: Text(
                                  'LOGIN',
                                ),
                                textColor: Colors.white,
                                color: kBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Forget password clicked');
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Forgot your password ?',
                                  textAlign: TextAlign.start,
                                  style: kClickableTextStyle,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 10.0,
                              ),
                              width: 250.0,
                              child: SignInButton(
                                Buttons.Google,
                                onPressed: () async {
                                  if (_auth.currentUser == null) {
                                    await signInWithGoogle();
                                    if (_auth.currentUser != null) {
                                      drawerHeaderProvider.setText(
                                          _auth.currentUser.displayName);
                                      drawerHeaderProvider
                                          .setPhoto(_auth.currentUser.photoURL);
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                                elevation: 10.0,
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'or',
                                style: kNormalTextStyle,
                              ),
                            ),
                            Container(
                              width: 150.0,
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 5.0,
                              ),
                              child: RaisedButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  Navigator.pushNamed(
                                      context, RegisterScreen.id);
                                },
                                child: Text(
                                  'REGISTER',
                                ),
                                textColor: Colors.white,
                                color: kBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
