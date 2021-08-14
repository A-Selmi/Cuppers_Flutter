import 'package:cuppers_flutter/extracted_widgets/login_text_field_widget.dart';
import 'package:cuppers_flutter/extracted_widgets/login_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

enum Gender { Male, Female }

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime _dateTime;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  Gender gender;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _firstNameErrorMessage = false;
  bool _lastNameErrorMessage = false;
  bool _emailErrorMessage = false;
  bool _passwordErrorMessage = false;
  bool _confirmPasswordErrorMessage = false;

  bool checkEmptyFields() {
    bool state = false;
    setState(() {
      _firstNameErrorMessage = _firstNameController.text.trim().isEmpty;
      _lastNameErrorMessage = _lastNameController.text.trim().isEmpty;
      _emailErrorMessage = _emailController.text.trim().isEmpty;
      _passwordErrorMessage = _passwordController.text.trim().isEmpty;
      _confirmPasswordErrorMessage =
          _confirmPasswordController.text.trim().isEmpty;
    });

    if (_firstNameErrorMessage) {
      _firstNameController.clear();
      state = true;
    }
    if (_lastNameErrorMessage) {
      _lastNameController.clear();
      state = true;
    }
    if (_emailErrorMessage) {
      _emailController.clear();
      state = true;
    }
    if (_passwordErrorMessage) {
      _passwordController.clear();
      state = true;
    }
    if (_confirmPasswordErrorMessage) {
      _confirmPasswordController.clear();
      state = true;
    }
    return state;
  }

  @override
  Widget build(BuildContext context) {
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
                  'Register',
                  style: kTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginTextWidget(
                              text: '* First Name',
                            ),
                            LoginTextFieldWidget(
                              text: 'Enter your first name',
                              textInputType: TextInputType.name,
                              maxLength: 15,
                              textEditingController: _firstNameController,
                              empty: _firstNameErrorMessage,
                              obscureValue: false,
                            ),
                            LoginTextWidget(
                              text: '* Last Name',
                            ),
                            LoginTextFieldWidget(
                              text: 'Enter your last name',
                              textInputType: TextInputType.name,
                              maxLength: 15,
                              textEditingController: _lastNameController,
                              empty: _lastNameErrorMessage,
                              obscureValue: false,
                            ),
                            LoginTextWidget(
                              text: '* Email',
                            ),
                            LoginTextFieldWidget(
                              text: 'Enter your email',
                              textInputType: TextInputType.emailAddress,
                              textEditingController: _emailController,
                              empty: _emailErrorMessage,
                              obscureValue: false,
                            ),
                            LoginTextWidget(
                              text: '* Password',
                            ),
                            LoginTextFieldWidget(
                              text: 'Enter your password',
                              textEditingController: _passwordController,
                              empty: _passwordErrorMessage,
                              obscureValue: false,
                              maxLength: 30,
                            ),
                            LoginTextWidget(
                              text: '* Confirm Password',
                            ),
                            LoginTextFieldWidget(
                              text: 'Enter your password',
                              textEditingController: _confirmPasswordController,
                              empty: _confirmPasswordErrorMessage,
                              obscureValue: false,
                              maxLength: 30,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Gender',
                                style: kNormalTextStyle,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Row(
                                children: [
                                  Radio(
                                    visualDensity: VisualDensity(
                                        vertical: -4.0, horizontal: -4.0),
                                    groupValue: gender,
                                    value: Gender.Male,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 4.0),
                                    child: Text(
                                      'Male',
                                      style: kNormalTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    visualDensity: VisualDensity(
                                        vertical: -4.0, horizontal: -4.0),
                                    groupValue: gender,
                                    value: Gender.Female,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Female',
                                    style: kNormalTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Date Of Birth',
                              style: kNormalTextStyle,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(1960),
                                  lastDate: DateTime(2025),
                                ).then((value) {
                                  setState(() {
                                    _dateTime = value;
                                  });
                                });
                              },
                              child: Text(
                                _dateTime == null
                                    ? 'Set Date Of Birth'
                                    : dateFormat.format(_dateTime),
                              ),
                              textColor: Colors.white,
                              color: kBlueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
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
                                  print(empty);
                                },
                                child: Text(
                                  'NEXT',
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
