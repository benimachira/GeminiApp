import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/screens/report_an_issue.dart';
import 'package:gemini_app/utils/user_service.dart';

import 'colors.dart';
import 'custom_color.dart';
import 'database_helper.dart';
import 'inventory_screen.dart';
import 'my_inventory.dart';
import 'my_leaderboard.dart';
import 'my_orders.dart';
import 'my_profile.dart';
import 'my_rewards.dart';
import 'my_sales.dart';
import 'my_team.dart';
import 'my_wallet.dart';
import 'notification.dart';
import 'order_summary.dart';

class HomescreenContent extends StatefulWidget {
  @override
  State<HomescreenContent> createState() => _HomescreenContentState();
}
class _HomescreenContentState extends State<HomescreenContent> {
  var color_purple = ColorsLocal.color_purple;

  var color_orange = ColorsLocal.color_orange;

  var color_blue = ColorsLocal.color_blue;
  DatabaseHelper db = DatabaseHelper.instance;
  var color_green = Colors.green;
  String token;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _get_token();


  }

  _get_token() async{
    token= await db.get_auth_token();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var tool_bar_height = kToolbarHeight;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: tool_bar_height,
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: top_info(context),
              ),
              SizedBox(
                height: 32,
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: search_info(context),
              ),
              SizedBox(
                height: 32,
              ),
              Flexible(
                flex: 6,
                fit: FlexFit.loose,
                child: _home_menu(context),
              ),
              SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget top_info(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => MyProfile(),
                ),
              );
            },
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[200],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                // color: HexColor('#D60812'),
              ),
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/user_avatar.jpeg',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              UserService().load_profile(token,6 );
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => MyProfile(),
                ),
              );
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Morning, Sarah Mbuthia',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[900]),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Account Balance:',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'KSH 27,000',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => OrderSummary(2)),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/images/Iconly_Two_tone_Buy.svg',
                      width: 22,
                      height: 22,
                      color: Colors.blue,
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 8,
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Notifications(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/images/Iconly_Two_tone_Notification.svg',
                      width: 22,
                      height: 22,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget search_info(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/home_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'What Produces are you looking for today?',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => InventoryScreen(),
                ),
              );
            },
            child: Container(
              // margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                color: Colors.white.withOpacity(.2),
              ),
              height: 42,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Search for Products',
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _home_menu(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MySales(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.subject,
                      //   color: Colors.blue,
                      // ),
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Work.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Sales',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyWallet(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Wallet.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Wallet',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => MyLeaderBoard()));
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Chart.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Leaderboard',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyOrders(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Document.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Orders',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyInventory(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Work.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Inventory',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyRewards(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Add_User.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Rewards',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyTeam(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_3_User.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Team',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Profile.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ReportIssue(1),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  decoration: new BoxDecoration(
                    border: Border.all(color: HexColor(color_blue), width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Iconly_Two_tone_Info_Circle.svg',
                        width: 22,
                        height: 22,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Report an issue',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
