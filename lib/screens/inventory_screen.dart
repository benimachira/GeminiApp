import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/models/model_inventory.dart';
import 'package:gemini_app/screens/custom_data.dart';
import 'package:gemini_app/screens/database_helper.dart';
import 'package:gemini_app/screens/universal_methods.dart';

import 'colors.dart';
import 'custom_bottom_button.dart';
import 'custom_color.dart';
import 'order_summary.dart';

final dbHelper = DatabaseHelper.instance;
var color_purple = ColorsLocal.color_purple;
var color_orange = ColorsLocal.color_orange;
var color_blue = ColorsLocal.color_blue;
var color_green = Colors.green;

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    List raw_data = CustomData().inventory_data;
    List<ModelInventory> data =
        raw_data.map((title) => ModelInventory(title)).toList();
    var category = CustomData().category_list;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
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
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    margin: EdgeInsets.only(right: 8, left: 8),
                    decoration: new BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      // color: HexColor('#D60812'),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 8,
                            child: Text(
                              'Search for a product',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 4, left: 4),
                      child: Chip(
                        backgroundColor: Colors.grey[200],
                        label: Text(
                          category[index],
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '34 Items in the search results',
              style: TextStyle(color: Colors.blue, fontSize: 13),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisSpacing: 24,
                //     mainAxisSpacing: 24,
                //     // childAspectRatio: (itemWidth / 120),
                //     crossAxisCount:
                //         (orientation == Orientation.portrait) ? 3 : 4),
                itemBuilder: (BuildContext context, int index) {
                  var info = data[index];
                  _item_count(info.id);

                  return InkWell(
                    onTap: () {
                      show_btm_data(data[index], height);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8, top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                info.image,
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${info.name}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'Package unit: ${info.pack_quantity} ${info.measure_unit}',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                  'kes ${info.price} - ${info.price_max}/${info.measure_unit}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder(
                                            future: _item_count(info.id),
                                            builder: (context, snapshot) {
                                              int count = 0;
                                              if (snapshot.hasData) {
                                                count = snapshot.data;
                                              } else {
                                                count = 0;
                                              }

                                              return Expanded(
                                                child: count > 0
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'Kes${(info.price * count)} - ${(info.price_max * count)}',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                              );
                                            }),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue[300],
                                                  width: 1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                              // color: HexColor('#D60812'),
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: Icon(
                                              Icons.remove,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          onTap: () {
                                            _add_item(info.id, 2);
                                            setState(() {});
                                          },
                                        ),
                                        SizedBox(
                                          width: width / 8,
                                        ),
                                        FutureBuilder(
                                            future: _item_count(info.id),
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
                                                          '${count} ${info.measure_unit}',
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 13,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 60,
                                                    );
                                            }),
                                        SizedBox(
                                          width: width / 8,
                                        ),
                                        InkWell(
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue[300],
                                                  width: 1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                              // color: HexColor('#D60812'),
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: Icon(
                                              Icons.add,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          onTap: () {
                                            _add_item(info.id, 1);
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FutureBuilder(
          future: dbHelper.all_cart(),
          builder: (context, snapshot) {
            int items = 0;
            // int price = 0;
            if (snapshot.hasData) {
              List data = snapshot.data;

              data.forEach((element) {
                items += element['quantity'];
                // price +=element[''];
              });

              if (items > 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => OrderSummary(1)),
                    );
                  },
                  child: CustomBottomButton(
                    'CHECK OUT ${items} ITEMS',
                    Icons.arrow_forward,
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  show_btm_data(data, height) {
    showModalBottomSheet(
      context: context,
      builder: (_) => MyBottomSheet(data, height),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  ModelInventory data;
  var height;

  MyBottomSheet(data, height) {
    this.data = data;
    this.height = height;
  }

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  var color_purple = ColorsLocal.color_purple;
  var color_orange = ColorsLocal.color_orange;
  var color_blue = ColorsLocal.color_blue;

  @override
  Widget build(BuildContext context) {
    ModelInventory _data = widget.data;

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: widget.height - 60,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: 40,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.close,
                          // color: HexColor(color_purple),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: Text(
                        'Product Description',
                        style: TextStyle(
                          // color: HexColor(color_purple),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: .7,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            _data.image,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Text(
                                  _data.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              FutureBuilder(
                                  future: _InventoryScreenState()
                                      ._item_count(_data.id),
                                  builder: (context, snapshot) {
                                    int count = 0;
                                    if (snapshot.hasData) {
                                      count = snapshot.data;
                                    } else {
                                      count = 0;
                                    }

                                    return Expanded(
                                      flex: 4,
                                      child: count > 0
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Kes${(_data.price * count)} - ${(_data.price_max * count)}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                    );
                                  }),

                              // Expanded(
                              //   flex: 4,
                              //   child: Text(
                              //     'KES ${_data.price} - ${_data.price_max}',
                              //     style: TextStyle(
                              //         fontSize: 14,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.loyalty,
                                color: Colors.blue,
                                size: 16,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  'KES ${_data.price} - ${_data.price_max}/${_data.measure_unit}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Flexible(
                            child: Text(
                              _data.description,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Chip(
                              backgroundColor: Colors.grey[200],
                              label: Text(
                                'Credits Ksh 4,000',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Center(
                            child: Container(
                              // decoration: new BoxDecoration(
                              //   border:
                              //       Border.all(color: Colors.blue, width: .2),
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(8),
                              //   ),
                              //   // color: HexColor('#D60812'),
                              // ),
                              height: 40,
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue[300],
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          // color: HexColor('#D60812'),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Icon(
                                          Icons.remove,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onTap: () {
                                        _InventoryScreenState()
                                            ._add_item(_data.id, 2);
                                        setState(() {});
                                      },
                                    ),

                                    SizedBox(
                                      width: 16,
                                    ),
                                    // Text(
                                    //   '2Kg',
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    FutureBuilder(
                                        future: _InventoryScreenState()
                                            ._item_count(_data.id),
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
                                                      '${count} ${_data.measure_unit}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  width: 60,
                                                );
                                        }),

                                    SizedBox(
                                      width: 16,
                                    ),

                                    InkWell(
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue[300],
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          // color: HexColor('#D60812'),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onTap: () {
                                        _InventoryScreenState()
                                            ._add_item(_data.id, 1);
                                        setState(() {});
                                      },
                                    ),

                                    // Container(
                                    //   decoration: new BoxDecoration(
                                    //     border: Border.all(
                                    //         color: Colors.grey, width: .2),
                                    //     borderRadius: BorderRadius.all(
                                    //       Radius.circular(50),
                                    //     ),
                                    //     // color: HexColor('#D60812'),
                                    //   ),
                                    //   padding: EdgeInsets.all(4),
                                    //   child: Icon(
                                    //     Icons.remove,
                                    //     color: Colors.blue,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 40,
                              decoration: new BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: .2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60),
                                ),
                                color: Colors.blue,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'ADD TO CART',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
