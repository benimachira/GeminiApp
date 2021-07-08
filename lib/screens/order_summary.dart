import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/models/model_inventory.dart';
import 'package:gemini_app/screens/universal_methods.dart';

import 'custom_bottom_button.dart';
import 'custom_color.dart';
import 'custom_data.dart';
import 'database_helper.dart';
import 'inventory_screen.dart';

class OrderSummary extends StatefulWidget {
  int source;

  OrderSummary(int source) {
    this.source = source;
  }

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final dbHelper = DatabaseHelper.instance;
  List<ModelInventory> all_data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List raw_data = CustomData().inventory_data;

    all_data = raw_data.map((title) => ModelInventory(title)).toList();
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
              largeTitle: Text('Order Summary'),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16),
          child: FutureBuilder(
              future: dbHelper.get_unchecked_from_cart(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else if (snapshot.hasData) {
                  List data = snapshot.data;
                  if (data.isEmpty)
                    return Center(
                      child: Text('No items in your cart at the moment'),
                    );
                  return ListView.builder(
                      itemCount: data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == data.length) {
                          return Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  widget.source==1
                                      ? Navigator.pop(context)
                                      : Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                InventoryScreen(),
                                          ),
                                        );
                                },
                                child: Container(
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Add more items to cart',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 18,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Delivery Scheduled',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          'You delivery is scheduled to be delivered on Thursday, 24th May 2021 at 9:00 am',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 13),
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
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Delivery Location',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          'Produce to be delivered at Otiende Market centre, Nairobi Kenya',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 13),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cost Estimations',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Products',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Note: The total above only represents the estimated and not the actual cost prices might be lower or slightly higher',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic),
                                    maxLines: 3,
                                  ),
                                  SizedBox(
                                    height: 64,
                                  ),
                                ],
                              )
                            ],
                          ));
                        }
                        Map selected_id = data[index];
                        final inventory = all_data
                            .firstWhere((e) => e.id == selected_id['item_id']);
                        print(inventory.name);
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 16, top: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    inventory.image,
                                    height: 60,
                                    width: 60,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${inventory.name}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          'Package unit: ${inventory.pack_quantity} ${inventory.measure_unit}',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                            'kes ${inventory.price} - ${inventory.price_max}/${inventory.measure_unit}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      FutureBuilder(
                                          future: _item_count(inventory.id),
                                          builder: (context, snapshot) {
                                            int count = 0;
                                            if (snapshot.hasData) {
                                              count = snapshot.data;
                                            } else {
                                              count = 0;
                                            }

                                            return count > 0
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Kes${(inventory.price * count)} - ${(inventory.price_max * count)}',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )
                                                : Container();
                                          }),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: .2),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                                // color: HexColor('#D60812'),
                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Icon(
                                                Icons.remove,
                                                size: 18,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            onTap: () {
                                              _add_item(inventory.id, 2);
                                              setState(() {});
                                            },
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          FutureBuilder(
                                              future: _item_count(inventory.id),
                                              builder: (context, snapshot) {
                                                int count = 0;
                                                if (snapshot.hasData) {
                                                  count = snapshot.data;
                                                } else {
                                                  count = 0;
                                                }

                                                return count > 0
                                                    ? Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${count} ${inventory.measure_unit}',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      )
                                                    : Container();
                                              }),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          InkWell(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: .2),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                                // color: HexColor('#D60812'),
                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Icon(
                                                Icons.add,
                                                size: 18,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            onTap: () {
                                              _add_item(inventory.id, 1);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                            )
                          ],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
      floatingActionButton: CustomBottomButton(
        'CHECKOUT CART',
        Icons.arrow_forward,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _add_item(item_id, action) async {
    List<Map<String, dynamic>> avail_list =
        await dbHelper.search_for_cart(item_id);
    int item_count;
    var date = UniversalMethods.get_current_date();
    if (action == 1) {
      if (avail_list.isNotEmpty) {
        avail_list.forEach((element) {
          Map<String, dynamic> cart_item = element;
          item_count = cart_item['quantity'] + 1;
        });
        await dbHelper.update_symptoms(item_id, item_count);
      } else {
        item_count = 0 + 1;
        await dbHelper.add_symptoms(item_id, item_count, date, 0);
      }
    } else if (action == 2) {
      if (avail_list.isNotEmpty) {
        avail_list.forEach((element) {
          Map<String, dynamic> cart_item = element;
          item_count = cart_item['quantity'];
          if (item_count > 0) {
            dbHelper.update_symptoms(item_id, (item_count - 1));
            return;
          } else {
            UniversalMethods.show_toast('Add to cart first');
            // dbHelper.update_symptoms(item_id, item_count);
            return;
          }
        });
      } else {
        UniversalMethods.show_toast('Add to cart first');
        item_count = 0;
        return;
      }
    }
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
