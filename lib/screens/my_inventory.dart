import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/models/model_inventory.dart';

import 'custom_data.dart';

class MyInventory extends StatefulWidget {
  @override
  _MyInventoryState createState() => _MyInventoryState();
}

class _MyInventoryState extends State<MyInventory> {
  int segmentedControlGroupValue = 0;

  Map<int, Widget> myTabs;

  @override
  Widget build(BuildContext context) {
    List raw_data = CustomData().inventory_data_custom;
    List<ModelInventory> inventory =
        raw_data.map((title) => ModelInventory(title)).toList();

    myTabs = <int, Widget>{0: Text('Open'), 1: Text('Closed')};

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
              largeTitle: Text('My Inventory'),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
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
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 16, left: 16),
                decoration: new BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  // color: HexColor('#D60812'),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ascending order',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      size: 16,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              segmentedControlGroupValue == 0
                  ? Container(
                      child: list_widget(inventory),
                    )
                  : inventory.isEmpty
                      ? Container(
                          child: Container(
                            child: Text('No items yet'),
                          ),
                        )
                      : Container(
                          child: list_widget(inventory),
                        ),
            ],
          ),
        ),
      ),
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
            onTap: () {},
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
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: new BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                // color: HexColor('#D60812'),
                              ),
                              child: Text(
                                '${inventry.pack_quantity} Packets remaining',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '11th April, 2020',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 11,
                        ),
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
}
