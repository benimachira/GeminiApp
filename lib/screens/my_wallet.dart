import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_color.dart';
import 'custom_data.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  AnimationController controller;
  Animation<Offset> offset;


  List<Map<String, dynamic>> payment_data = CustomData().open_payment_data;
  List<Map<String, dynamic>> closed_payment_data =
      CustomData().closed_payment_data;
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Open"),
    1: Text("Closed")
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              largeTitle: Text('My Wallet'),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, right: 16, left: 8),
              child: Container(
                padding: EdgeInsets.all(12),
                // decoration: new BoxDecoration(
                //   color: Colors.grey[200],
                //   border: Border.all(color: Colors.grey[500], width: .2),
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(50),
                //   ),
                //   // color: HexColor('#D60812'),
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Cumulative Profits',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'KES 114,300.00',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.all(16),
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
            SizedBox(
              height: 4,
            ),
            segmentedControlGroupValue == 1
                ? Expanded(
                    child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: closed_payment_data.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                closed_payment_data[index];
                            return Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(bottom: 2),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.only(
                                        right: 8, left: 8, top: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(
                                                color: Colors.grey, width: .2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                            // color: HexColor('#D60812'),
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: SvgPicture.asset(
                                            'assets/images/Iconly_Two_tone_Wallet.svg',
                                            width: 24,
                                            height: 24,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color:
                                                            Colors.grey[800]),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    data['description'],
                                                    maxLines: 10,
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          data['time'],
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ExpansionTile(
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Payment Breakdown',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(child: Text('Total')),
                                                Text('KES 3,000',
                                                    style: TextStyle(
                                                        color: Colors.grey[700],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Amount for repayment')),
                                                      Text('KES 3,000',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'inventory cost')),
                                                      Text('KES 1,000',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Profit Share')),
                                                      Text('KES 200',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Losses Share')),
                                                      Text('KES 0',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text('Profits')),
                                                Text('KES 200',
                                                    style: TextStyle(
                                                        color: Colors.grey[700],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    color: Colors.grey[100],
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: .2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                    // color: HexColor('#D60812'),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    'Due date: Tomorrow 21st May 2020',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            right: 16, left: 16),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                : Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: closed_payment_data.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                closed_payment_data[index];
                            return Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(bottom: 2),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(
                                                color: Colors.grey, width: .2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                            // color: HexColor('#D60812'),
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: SvgPicture.asset(
                                            'assets/images/Iconly_Two_tone_Wallet.svg',
                                            width: 24,
                                            height: 24,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Colors.grey[800]),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    data['description'],
                                                    maxLines: 10,
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          data['time'],
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ExpansionTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: new BoxDecoration(
                                            // color: Colors.grey[100],
                                            border: Border.all(
                                                color: Colors.grey, width: .2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                            // color: HexColor('#D60812'),
                                          ),
                                          margin: EdgeInsets.only(
                                              top: 16, bottom: 16, left: 16),
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Due date: Tomorrow 21st May 2020',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Payment Breakdown',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(child: Text('Total')),
                                                Text('KES 3,000',
                                                    style: TextStyle(
                                                        color: Colors.grey[700],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Amount for repayment')),
                                                      Text('KES 3,000',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'inventory cost')),
                                                      Text('KES 1,000',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Profit Share')),
                                                      Text('KES 200',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Losses Share')),
                                                      Text('KES 0',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text('Profits')),
                                                Text('KES 200',
                                                    style: TextStyle(
                                                        color: Colors.grey[700],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    color: Colors.grey[100],
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: .2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                    // color: HexColor('#D60812'),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    'Make your daily payments',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                            right: 16, left: 16),
                                      )
                                    ],
                                  ),

                                  // ExpansionTile(
                                  //   title: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       Container(
                                  //         decoration: new BoxDecoration(
                                  //           // color: Colors.grey[100],
                                  //           border: Border.all(
                                  //               color: Colors.grey, width: .2),
                                  //           borderRadius: BorderRadius.all(
                                  //             Radius.circular(50),
                                  //           ),
                                  //           // color: HexColor('#D60812'),
                                  //         ),
                                  //         padding: EdgeInsets.all(8),
                                  //         child: Text(
                                  //           'Due date: Tomorrow 21st May 2020',
                                  //           style: TextStyle(fontSize: 12),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   children: [
                                  //     Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         SizedBox(
                                  //           height: 32,
                                  //         ),
                                  //         SizedBox(
                                  //           height: 8,
                                  //         ),
                                  //         Text(
                                  //           'Payment Breakdown',
                                  //           style: TextStyle(
                                  //               fontWeight: FontWeight.bold,
                                  //               fontSize: 16),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 16,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Expanded(child: Text('Total')),
                                  //             Text('KES 3,000',
                                  //                 style: TextStyle(
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 8,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Expanded(child: Text('Profits')),
                                  //             Text('KES 1,000',
                                  //                 style: TextStyle(
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 8,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Expanded(
                                  //                 child: Text('Service fee')),
                                  //             Text('KES 200',
                                  //                 style: TextStyle(
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 8,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Expanded(child: Text('Pay out')),
                                  //             Text(
                                  //               'KES 1,600',
                                  //               style: TextStyle(
                                  //                   fontWeight:
                                  //                       FontWeight.bold),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 16,
                                  //         ),
                                  //         Text(
                                  //           'Due date: Tomorrow 21st May 2020',
                                  //           style: TextStyle(
                                  //               color: Colors.blue,
                                  //               fontSize: 12),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 32,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Container(
                                  //               decoration: new BoxDecoration(
                                  //                 color: Colors.grey[100],
                                  //                 border: Border.all(
                                  //                     color: Colors.grey,
                                  //                     width: .2),
                                  //                 borderRadius:
                                  //                     BorderRadius.all(
                                  //                   Radius.circular(50),
                                  //                 ),
                                  //                 // color: HexColor('#D60812'),
                                  //               ),
                                  //               padding: EdgeInsets.all(8),
                                  //               child: Text(
                                  //                   'Make your daily payment'),
                                  //             ),
                                  //           ],
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.center,
                                  //         ),
                                  //         SizedBox(
                                  //           height: 16,
                                  //         ),
                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
