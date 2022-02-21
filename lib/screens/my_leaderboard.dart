import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_data.dart';
import 'inventory_screen.dart';

class MyLeaderBoard extends StatefulWidget {
  @override
  _MyLeaderBoardState createState() => _MyLeaderBoardState();
}

class _MyLeaderBoardState extends State<MyLeaderBoard> {
  int segmentedControlGroupValue = 0;

  List<Map<String, dynamic>> people_data = CustomData().people_data;

  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Today"),
    1: Text("Yesterday"),
    2: Text("Week"),
    3: Text("Month"),
    4: Text("Year")
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
              ),
              largeTitle: Text('My LeaderBoard'),
            ),
          ];
        },
        body: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSlidingSegmentedControl(
                        groupValue: segmentedControlGroupValue,
                        children: myTabs,
                        onValueChanged: (i) {
                          setState(() {
                            segmentedControlGroupValue = i;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: people_data.length,
                    itemBuilder: (context, index) {
                      Map person = people_data[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 16, top: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(person['avatar']),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        '${person['name']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text('KES 30,000',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
