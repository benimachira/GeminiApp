import 'package:flutter/material.dart';
import 'package:gemini_app/screens/colors.dart';
import 'package:gemini_app/screens/login.dart';
import 'package:flutter/cupertino.dart';

import 'custom_color.dart';

class VerifyPhone extends StatelessWidget {
  var _name_controller = TextEditingController(text: '');
  var color_green = ColorsLocal.color_green;


  @override
  Widget build(BuildContext context) {
    var tool_bar_height = kToolbarHeight;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Enter Verification code',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          'We sent a 4 digit verification code verify and continue',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Enter code',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _name_controller,
                            minLines: 1,
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                              hintText: '',
                              hintStyle:
                                  TextStyle(fontSize: 13, color: Colors.grey),
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
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _name_controller,
                            minLines: 1,
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                              hintText: '',
                              hintStyle:
                                  TextStyle(fontSize: 13, color: Colors.grey),
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
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _name_controller,
                            minLines: 1,
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                              hintText: '',
                              hintStyle:
                                  TextStyle(fontSize: 13, color: Colors.grey),
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
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _name_controller,
                            minLines: 1,
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                              hintText: '',
                              hintStyle:
                                  TextStyle(fontSize: 13, color: Colors.grey),
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
                            // validator: (val) {
                            //   if (val.length == 0) {
                            //     return "Name cannot be empty";
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            keyboardType: TextInputType.name,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text(
                        'Resend code',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor(color_green), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => Login()));
                      },
                      // color: HexColor('#0F305E'),
                      // textColor: Colors.white,
                      child: Text(
                        "Verify phone number",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
