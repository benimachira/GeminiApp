import 'package:flutter/material.dart';
import 'package:gemini_app/models/model_inventory.dart';
import 'package:gemini_app/screens/custom_data.dart';

class PickUp extends StatefulWidget {
  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  List<ModelInventory> inventory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List raw_data = CustomData().inventory_data;

    inventory = raw_data.map((title) => ModelInventory(title)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick ups'),
      ),
      body: Container(
        height: 100,
        child: ListView.builder(
            itemCount: inventory.length,
            itemBuilder: (context, index) {
              ModelInventory _inventory = inventory[index];
              return Container(
                child: Row(
                  children: [
                    Image.asset(_inventory.image),
                    Column(
                      children: [
                        Text(_inventory.name),
                        Text('pack: 2kg'),
                        Text('Quantity:4'),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
