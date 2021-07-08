import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeamMemberDetails extends StatelessWidget {
  Map person = {};

  TeamMemberDetails(person) {
    this.person = person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              leading: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                ),
              ),
              largeTitle: Text('Team Details'),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person['name'],
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(person['email']),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Stack(
            children: list(),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> data = [
    {'index': 1, 'image': '', 'title': 'profile'},
    {
      'index': 2,
      'image': 'assets/images/Iconly_Two_tone_Wallet.svg',
      'title': 'Wallet'
    },
    {
      'index': 3,
      'image': 'assets/images/Iconly_Two_tone_Info_Circle.svg',
      'title': 'Report issue'
    },
    {
      'index': 4,
      'image': 'assets/images/Iconly_Two_tone_Work.svg',
      'title': 'Purchase History'
    },
    {
      'index': 5,
      'image': 'assets/images/Iconly_Two_tone_Document.svg',
      'title': 'Sales History'
    },
    {
      'index': 6,
      'image': 'assets/images/Iconly_Two_tone_Work.svg',
      'title': 'Inventory'
    },
  ];

  double radius = 100.0;

  List<Widget> list() {
    final double firstItemAngle = pi;
    final double lastItemAngle = pi;
    final double angleDiff = (firstItemAngle + lastItemAngle) / 5;
    double currentAngle = firstItemAngle;

    return data.map((Map data_map) {
      currentAngle += angleDiff;
      return _radialListItem(currentAngle, data_map['index']);
    }).toList();
  }

  Widget _radialListItem(double angle, int index) {
    final x = cos(angle) * radius;
    final y = sin(angle) * radius;

    return Center(
      child: Transform(
          transform: index == 1
              ? Matrix4.translationValues(0.0, 0.0, 0.0)
              : Matrix4.translationValues(x, y, 0.0),
          child: InkWell(
              onTap: () {
                print(index.toString());
              },
              child: index == 1
                  ? Container(
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.blue[400],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(person['avatar']),
                        ),
                      ),
                    )
                  : Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.blue[400],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              '${data[index - 1]['image']}',
                              height: 24,
                              width: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              '${data[index - 1]['title']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ))),
    );
  }
}
