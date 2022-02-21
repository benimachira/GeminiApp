import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/screens/my_sale_summary.dart';

import 'my_orders_summary.dart';

class MyOrders extends StatefulWidget {
  @override
  _MySalesState createState() => _MySalesState();
}

class _MySalesState extends State<MyOrders> {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('My Orders'),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16, right: 16, left: 8),
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey[500], width: .2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey[300],
                          border:
                              Border.all(color: Colors.grey[300], width: .2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          // color: HexColor('#D60812'),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.lightbulb_outline,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              'Start date',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'April 21, 2020',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              'End date',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'January 21, 2021',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16, left: 16),
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, item) {
                    return Column(
                      children: [
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16, top: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'KES 3,950',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Order number #s-34574',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Thus, April 21 2020',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.blue),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '07:30 AM',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => MYOrderSummary(),
                              ),
                            );
                          },
                        ),
                        Divider(
                          color: Colors.grey[300],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
