import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/screens/distribute_inventory.dart';

import 'TeamMemberDetails.dart';
import 'custom_data.dart';

class MyTeam extends StatelessWidget {
  List<Map<String, dynamic>> people_data = CustomData().people_data;

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
              largeTitle: Text('My Team'),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Team Sales',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'KES 114,300.00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => DistributeInventory(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.only(right: 2, left: 16, top: 2, bottom: 2),
                  decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Distribute Produce',
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: new BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          // color: HexColor('#D60812'),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: people_data.length,
                      itemBuilder: (context, index) {
                        Map person = people_data[index];
                        return Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      TeamMemberDetails(person),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16, top: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 36,
                                        width: 36,
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
                                            Text('${person['email']}',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '18th May, 2020',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 16,
                                            color: Colors.grey[400],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey[200],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
