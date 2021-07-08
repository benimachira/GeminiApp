import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/screens/my_profile.dart';

import 'custom_data.dart';

class MyRefferals extends StatefulWidget {
  @override
  _MyRefferalsState createState() => _MyRefferalsState();
}

class _MyRefferalsState extends State<MyRefferals> {
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
              largeTitle: Text('My Referrals'),
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
                'Invited 4 new friend',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: people_data.length,
                      itemBuilder: (context, index) {
                        Map person = people_data[index];

                        return InkWell(
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
                                          Text('${person['phone']}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '18th May, 2020',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
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
