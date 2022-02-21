import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../home_screen_content.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var color_purple = ColorsLocal.color_purple;

  var color_orange = ColorsLocal.color_orange;

  var color_blue = ColorsLocal.color_blue;

  var color_green = Colors.green;

  PageController controller = PageController();

  int bottomSelectedIndex = 0;





  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomescreenContent(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 8, left: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    bottomTapped(0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/images/Iconly_Two_tone_Home.svg',
                      width: 24,
                      height: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    bottomTapped(1);
                  },

                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => RecieveInventory(),
                  //     ),
                  //   );
                  // },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/images/Iconly_Two_tone_Category.svg',
                      width: 24,
                      height: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    bottomTapped(2);
                  },
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => DistributeInventory(),
                  //     ),
                  //   );
                  // },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/images/Iconly_Two_tone_Scan.svg',
                      width: 24,
                      height: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    bottomTapped(3);
                  },
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => MyAccount(),
                  //     ),
                  //   );
                  // },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/images/Iconly_Two_tone_Profile.svg',
                      width: 24,
                      height: 24,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
