import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/models/model_inventory.dart';

import 'custom_data.dart';
import 'database_helper.dart';

class RecieveIventorySummary extends StatefulWidget {
  List inventory;

  RecieveIventorySummary(inventory) {
    this.inventory = inventory;
  }

  @override
  _SaleSummaryState createState() => _SaleSummaryState();
}

class _SaleSummaryState extends State<RecieveIventorySummary> {
  AnimationController controller;
  Animation<Offset> offset;
  List raw_data = CustomData().inventory_data_custom;
  double total = 0;

  final dbHelper = DatabaseHelper.instance;
  List<ModelInventory> closed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    closed = widget.inventory;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Received Orders Summary'),
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
                        'Order number #s-34574',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16, left: 16),
                child: ListView.builder(
                  itemCount: closed.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var inventry = closed[index];

                    total = total + inventry.price;

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
                                      'KES ${inventry.price} - ${inventry.price_max} /${inventry.measure_unit}',
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
                              Column(
                                children: [
                                  Text(
                                    '${inventry.price} * 2',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
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
                                            ? Text(
                                                'KES ${count * inventry.price}',
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            : Text(
                                                'KES ${2 * inventry.price}',
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              );
                                      }),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  inventry.qr_status == 0
                                      ? Icon(
                                          Icons.check_circle_outline,
                                          size: 18,
                                          color: Colors.grey[300],
                                        )
                                      : Icon(
                                          Icons.check_circle,
                                          size: 18,
                                          color: Colors.green,
                                        ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.end,
                              ),
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
                    SizedBox(
                      height: 24,
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
                            Icons.calendar_today_outlined,
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
                                      'Order Fulfillment Detail',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Your order was ful lled on Thursday, 24th May 2021 at 9:25 am',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 13),
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 24,
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
                        Text(
                          'Inventory Cost Break down',
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
                          'Products',
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
                          'KES ${totals(total)}',
                          style: TextStyle(fontWeight: FontWeight.w600),
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
                          'KES ${totals(total)}',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
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

  totals(total) {
    for (int i = 0; i < closed.length; i++) {
      total = total + closed[i].price_max;
    }
    return total;
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
