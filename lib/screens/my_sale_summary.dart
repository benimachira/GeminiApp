import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/models/model_inventory.dart';

import 'custom_data.dart';
import 'database_helper.dart';

class SaleSummary extends StatefulWidget {
  @override
  _SaleSummaryState createState() => _SaleSummaryState();
}

class _SaleSummaryState extends State<SaleSummary> {
  AnimationController controller;
  Animation<Offset> offset;
  List raw_data = CustomData().inventory_data_custom;
  List<ModelInventory> inventory = null;
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    inventory = raw_data.map((title) => ModelInventory(title)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Sales Summary'),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sales number #s-34574',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16, left: 16),
                child: ListView.builder(
                  itemCount: inventory.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var inventry = inventory[index];
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 16, top: 16),
                          child: Row(
                            children: [
                              Image.asset(
                                inventry.image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      inventry.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Packaged in ${inventry.pack_quantity}${inventry.measure_unit}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${inventry.pack_quantity} Packets',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                              FutureBuilder(
                                  future: _item_count(inventry.id),
                                  builder: (context, snapshot) {
                                    int count = 0;
                                    if (snapshot.hasData) {
                                      count = snapshot.data;
                                    } else {
                                      count = 0;
                                    }

                                    return count > 0
                                        ? Container(
                                            width: 60,
                                            child: Center(
                                              child: Text(
                                                'KES ${count * inventry.price}',
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 60,
                                            child: Text(
                                              'KES ${2 * inventry.price}',
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          );
                                  }),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[300],
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.grey[100],
                            border: Border.all(color: Colors.grey, width: .2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            // color: HexColor('#D60812'),
                          ),
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/images/Iconly_Two_tone_Calendar.svg',
                            width: 16,
                            height: 16,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Sales Date',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'This sales report is for date Thursday, 24th May 202',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 13),
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.grey[100],
                            border: Border.all(color: Colors.grey, width: .2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            // color: HexColor('#D60812'),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Payment Method',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'MPESA',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Payment was done on Thursday, 24th May 2021 at 12:30pm with receipt number : #PE438GH40',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 13),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Sales',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(child: Text('')),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'KES 10,000',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

  _item_count(id) async {
    var x = await dbHelper.search_for_cart(id);
    int count = 0;
    x.forEach((element) {
      count = element['quantity'];
    });
    return count;
  }
}
