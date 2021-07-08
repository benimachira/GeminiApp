import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/models/model_inventory.dart';
import 'package:gemini_app/screens/recieve_inventory_summary.dart';

import 'custom_data.dart';
import 'database_helper.dart';

class DistributeInventory extends StatefulWidget {
  @override
  _RecieveInventoryState createState() => _RecieveInventoryState();
}

class _RecieveInventoryState extends State<DistributeInventory> {
  final dbHelper = DatabaseHelper.instance;

  List raw_data = CustomData().inventory_data_custom;

  List<ModelInventory> inventory = null;

  @override
  void initState() {
    // TODO: implement initState
    inventory = raw_data.map((title) => ModelInventory(title)).toList();
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
              largeTitle: Text('Distribute Inventory'),
            ),
          ];
        },
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ORDER ID: #34574',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        color: Colors.grey[100],

                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            'Report an Issue',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/images/Iconly_Two_tone_Info_Circle.svg',
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Image.asset(
                    'assets/images/qr_image.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.35,
                minChildSize: 0.2,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Card(
                          elevation: 12.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                            ),
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: 4,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Distribution Basket',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 16, left: 16),
                                  child: ListView.builder(
                                    itemCount: inventory.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var inventry = inventory[index];
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 16, top: 16),
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '100 * 2',
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    FutureBuilder(
                                                        future: _item_count(
                                                            inventry.id),
                                                        builder: (context,
                                                            snapshot) {
                                                          int count = 0;
                                                          if (snapshot
                                                              .hasData) {
                                                            count =
                                                                snapshot.data;
                                                          } else {
                                                            count = 0;
                                                            final dbHelper =
                                                                DatabaseHelper
                                                                    .instance;
                                                          }

                                                          return count > 0
                                                              ? Text(
                                                                  'KES ${count * inventry.price}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          700],
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                )
                                                              : Text(
                                                                  'KES ${2 * inventry.price}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          700],
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                );
                                                        }),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .check_circle_outline,
                                                      size: 18,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ],
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
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
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(16),
        decoration: new BoxDecoration(
          color: Colors.blue,

          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          // color: HexColor('#D60812'),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => RecieveIventorySummary([]),
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 9,
                child: Text(
                  'CHECK OUT',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                ),
              ),
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
