import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_button.dart';

class ChangePassword extends StatelessWidget {
  var _name_controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Change password',
              ),
            )
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text('Enter Old Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _name_controller,
                        minLines: 1,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '******',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text('New Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _name_controller,
                        minLines: 1,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '******',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text('Confirm Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _name_controller,
                        minLines: 1,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '******',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomButton(
        'CHANGE PASSWORD',
        Icons.shield_outlined,
      ),
    );
  }
}
