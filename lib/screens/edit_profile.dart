import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_button.dart';

class EditProfile extends StatelessWidget {
  var _name_controller = TextEditingController(text: '');
  var _name2_controller = TextEditingController(text: '');
  var description_controller = TextEditingController(
      text: 'is simply dummy text of the printing and typese ing industry. '
          'Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, '
          'when an unknown printer took a galley of type and scrambled');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/user_avatar.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Change profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '@fatuma_moha25',
                  style: TextStyle(color: Colors.blue, fontSize: 13),
                ),
                SizedBox(
                  height: 32,
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
                      Text('First Name'),
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
                            hintText: 'Fatma',
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
                      Text('Last Name'),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _name2_controller,
                          minLines: 1,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mohamed',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biography',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '',
                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: description_controller,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mohamed',
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '53 character remaining',
                          textAlign: TextAlign.end,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomButton(
        'UPDATE PROFILE',
        Icons.edit,
      ),
    );
  }
}
