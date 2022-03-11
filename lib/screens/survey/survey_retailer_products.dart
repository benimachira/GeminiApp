import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/screens/custom_bottom_button.dart';
import 'package:gemini_app/screens/universal_methods.dart';

import '../database_helper.dart';

class SurveyRetailerProducts extends StatefulWidget {
  @override
  State<SurveyRetailerProducts> createState() => _SurveyRetailerProductsState();

  dynamic id;
  SurveyRetailerProducts(dynamic id){
    this.id = id;
  }
}



class _SurveyRetailerProductsState extends State<SurveyRetailerProducts> {
  TextEditingController name_controller = TextEditingController();

  TextEditingController avg_controller = TextEditingController();

  TextEditingController sale_price_controller = TextEditingController();

  TextEditingController purchase_controller = TextEditingController();

  TextEditingController avg_size_controller = TextEditingController();

  DatabaseHelper db = DatabaseHelper.instance;
  List<String> _markets = ['Select Category', 'Fruit', 'Vegitable'];
  String _selectedmarket = 'Select Category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
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
              largeTitle: Text('Retailer Acquisition Survey'),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  height: 45,
                  child: FutureBuilder(
                      future: db.get_survey(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Map> data = snapshot.data;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  '${data.length} items added',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Error',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 32,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: _selectedmarket,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: _markets.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    // hint: Text(
                    //   "Blood type",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500),
                    // ),
                    onChanged: (String value) {
                      setState(() {
                        _selectedmarket = value;
                        // _chosenValue = value;
                        //
                        //
                        // print(_chosenValue);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: name_controller,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Product name',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: avg_controller,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Daily average sales (KG)',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: purchase_controller,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Buying price',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: sale_price_controller,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Sale price',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: avg_size_controller,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Average customer price',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
                ),
                SizedBox(
                  height: 32,
                ),
                InkWell(
                    onTap: () {
                      _save_item();
                    },
                    child: CustomBottomButton('Save', Icons.add)),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _save_item() async {
    String name = name_controller.text;
    String avg_sale = avg_controller.text;
    String bp = purchase_controller.text;
    String sp = sale_price_controller.text;
    String avg_price = avg_size_controller.text;
    String market = _selectedmarket;

    if (_selectedmarket == 'Select Category') {
      UniversalMethods.show_toast('Add Category');
      return;
    }

    if (name.isEmpty) {
      UniversalMethods.show_toast('Add product name');
      return;
    }

    if (avg_sale.isEmpty) {
      UniversalMethods.show_toast('Add Avg sales');
      return;
    }

    if (bp.isEmpty) {
      UniversalMethods.show_toast('Add buying price');
      return;
    }

    if (sp.isEmpty) {
      UniversalMethods.show_toast('Add sale price');
      return;
    }

    if (avg_price.isEmpty) {
      UniversalMethods.show_toast('Add avg customer price');
      return;
    }

    try {
      await db.add_survey_seller_item(
          market, name, avg_price, bp, sp, avg_price,widget.id);
      setState(() {
        UniversalMethods.show_toast('${name} added');

        name_controller.text ='';
        avg_controller.text ='';
        purchase_controller.text ='';
        sale_price_controller.text='';
        avg_size_controller.text='';
        _selectedmarket ='Select Category';
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}
