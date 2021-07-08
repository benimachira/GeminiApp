import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('My Rewards'),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16, right: 16, left: 8),
                child: Container(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Accomplishments',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(right: 16, left: 16, bottom: 32),
                      decoration: new BoxDecoration(
                        border: Border.all(color: Colors.grey[200]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'MAKE 20 SALES AND WIN!!',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Text(
                                'Code: 12392',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                'GET 3 JACKETS AND FREE CREDIT WORTH 1,000',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(''),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                'You’ve sold 18 items',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
