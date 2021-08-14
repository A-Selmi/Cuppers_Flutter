import 'package:cuppers_flutter/screens/items_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool state = true;
  List<String> list = [
    'images/coffee.jpg',
    'images/tea.jpg',
    'images/mug.jpg',
    'images/tray.jpg'
  ];
  List<String> text = ['Coffee', 'Tea', 'Mugs', 'Trays'];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        state = false;
      });
    });
  }

  void categorySelected(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemsScreen(categoryName: text[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => categorySelected(index),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Image.asset(
                            list[index],
                            fit: BoxFit.fill,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              bottom: 20.0,
                              top: 10.0,
                            ),
                            color: Color(0x40000000),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  text[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Visibility(
          visible: state,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
