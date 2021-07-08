import 'package:flutter/material.dart';
import 'package:gemini_app/screens/colors.dart';
import 'package:gemini_app/screens/login.dart';
import 'package:flutter/cupertino.dart';

import 'custom_color.dart';

class ResetPassword extends StatelessWidget {
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
              flex: 8,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _name_controller,
                      minLines: 1,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        hintText: 'New password',
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
                      height: 16,
                    ),
                    TextFormField(
                      controller: _name_controller,
                      minLines: 1,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        hintText: 'Confirm password',
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
                        "Reset password",
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
