import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/models/model_inventory.dart';
import 'package:gemini_app/screens/qr_code_scanner.dart';
import 'package:gemini_app/screens/recieve_inventory_summary.dart';
import 'package:gemini_app/screens/universal_methods.dart';

import 'custom_bottom_button.dart';
import 'custom_data.dart';
import 'database_helper.dart';

class RecieveInventory extends StatefulWidget {
  @override
  _RecieveInventoryState createState() => _RecieveInventoryState();
}

class _RecieveInventoryState extends State<RecieveInventory> {
  final dbHelper = DatabaseHelper.instance;

  List raw_data = CustomData().inventory_data_custom;

  List<ModelInventory> inventory = null;
  int segmentedControlGroupValue = 0;
  Map<int, Widget> myTabs;

  @override
  void initState() {
    // TODO: implement initState
    inventory = raw_data.map((title) => ModelInventory(title)).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ModelInventory> open =
        inventory.where((e) => e.qr_status == 0).toList();
    List<ModelInventory> closed =
        inventory.where((e) => e.qr_status == 1).toList();

    myTabs = <int, Widget>{
      0: Text('${open.length} Open'),
      1: Text('${closed.length} Closed')
    };

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              leading: Material(
                child: InkWell(
                  // onTap: () {
                  //   Navigator.pop(context);
                  // },
                  child: Container(),
                ),
              ),
              largeTitle: Text('Receive Inventory'),
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
                initialChildSize: 0.4,
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
                                  height: 16,
                                ),
                                Text(
                                  'Order Basket',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CupertinoSlidingSegmentedControl(
                                            groupValue:
                                                segmentedControlGroupValue,
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
                                  height: 8,
                                ),
                                segmentedControlGroupValue == 0
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: list_widget(open),
                                      )
                                    : closed.isEmpty
                                        ? Container(
                                            child: Container(
                                              child: Text('No items yet'),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                            ),
                                          )
                                        : Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: list_widget(closed),
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
      floatingActionButton: closed.isNotEmpty
          ? InkWell(
              onTap: () {
                if (closed.isNotEmpty) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RecieveIventorySummary(closed),
                    ),
                  );
                } else {
                  UniversalMethods.show_toast('Scan some items first');
                }
              },
              child: CustomBottomButton(
                '${closed.length}/${inventory.length} RECEIVED',
                Icons.arrow_forward,
              ),
            )
          : Container(),
    );
  }

  Widget list_widget(list) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16),
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          ModelInventory inventry = list[index];
          return InkWell(
            onTap: () {
              inventry.qr_status == 0
                  ? _navigateAndDisplaySelection(context, inventry)
                  : () {};
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32),
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
                              future: _item_count(inventry.id),
                              builder: (context, snapshot) {
                                int count = 0;
                                if (snapshot.hasData) {
                                  count = snapshot.data;
                                } else {
                                  count = 0;
                                  final dbHelper = DatabaseHelper.instance;
                                }

                                return count > 0
                                    ? Text(
                                        'KES ${count * inventry.price}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : Text(
                                        'KES ${2 * inventry.price}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
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
            ),
          );
        },
      ),
    );
  }

  void _navigateAndDisplaySelection(BuildContext context, inventry) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => QRScanner(inventry),
      ),
    );
    setState(() {});

    UniversalMethods.show_toast(
        '${result != null ? result : 'Error Scanning'}');

    // // After the Selection Screen returns a result, hide any previous snackbars
    // // and show the new result.
    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text('$result')));
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
