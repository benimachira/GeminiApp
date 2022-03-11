import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_button.dart';

class ScreenLoginVerify extends StatefulWidget {
  @override
  State<ScreenLoginVerify> createState() => _ScreenLoginVerifyState();
}

class _ScreenLoginVerifyState extends State<ScreenLoginVerify> {
  var _name_controller = TextEditingController(text: '');

  var _pass_controller = TextEditingController(text: '');
  List<String> _locations = ['Select County', 'B', 'C', 'D'];
  List<String> _markets = ['Select Market', 'B', 'C', 'D'];
  String _selectedLocation = 'Select County';
  String _selectedmarket = 'Select Market';
  bool checkedValue = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Account Details'),
            )
          ];
        },
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          focusColor: Colors.white,
                          value: _selectedLocation,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: _locations.map<DropdownMenuItem<String>>((String value) {
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
                              _selectedLocation = value;
                              // _chosenValue = value;
                              //
                              //
                              // print(_chosenValue);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _name_controller,
                  minLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 16,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'First name',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
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
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _pass_controller,
                  minLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 16,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
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
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _name_controller,
                  minLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 16,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
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
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _pass_controller,
                  minLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 16,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Email Address (Optional)',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
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
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _pass_controller,
                  minLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 16,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Create New Password',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
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
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _pass_controller,
                  minLines: 1,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 16,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
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
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I agree to the terms and conditions',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                CustomBottomButton(
                  'UPDATE MY INFORMATION',
                  Icons.arrow_forward,
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
