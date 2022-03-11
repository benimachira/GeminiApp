import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/screens/colors.dart';
import 'package:gemini_app/screens/inventory_screen.dart';
import 'package:gemini_app/screens/my_inventory.dart';
import 'package:gemini_app/screens/my_profile.dart';
import 'package:gemini_app/screens/my_team.dart';
import 'package:gemini_app/screens/recieve_inventory.dart';
import 'package:gemini_app/screens/report_an_issue.dart';
import 'package:gemini_app/screens/my_account.dart';
import 'package:gemini_app/screens/survey/survey_category.dart';
import 'package:sqflite/sqflite.dart';

import 'custom_color.dart';
import 'database_helper.dart';
import 'distribute_inventory.dart';
import 'home_screen_content.dart';
import 'my_leaderboard.dart';
import 'my_orders.dart';
import 'my_rewards.dart';
import 'my_sales.dart';
import 'my_wallet.dart';
import 'notification.dart';
import 'order_summary.dart';

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

  DatabaseHelper db = DatabaseHelper.instance;
  List<Widget> page_list = [
    HomescreenContent(),
    RecieveInventory(),
    DistributeInventory(),
    MyAccount(),
  ];

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
      body: Container(
        child: PageView.builder(
          onPageChanged: (index) {
            pageChanged(index);
          },
          itemCount: page_list.length,
          itemBuilder: (context, index) {
            return page_list[bottomSelectedIndex];
          },
          controller: controller,
        ),
      ),
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
