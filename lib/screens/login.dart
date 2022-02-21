import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gemini_app/screens/colors.dart';
import 'package:gemini_app/screens/database_helper.dart';
import 'package:gemini_app/screens/reset_password.dart';
import 'package:gemini_app/screens/universal_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:gemini_app/utils/user_service.dart';

import 'HomeScreen.dart';
import 'custom_color.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _name_controller = TextEditingController(text: '');

  var _pass_controller = TextEditingController(text: '');

  var color_green = ColorsLocal.color_green;
  DatabaseHelper db = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                        prefixIcon: Icon(
                          Icons.person,
                          size: 16,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        hintText: 'User name',
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
                      controller: _pass_controller,
                      minLines: 1,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 16,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        hintText: 'Password',
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
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ResetPassword()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Forgot password',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          ),
                        ),
                      ),
                    )
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

                        String name= _name_controller.text;
                        String pass= _pass_controller.text;

                        if (name.isEmpty) {
                          UniversalMethods.show_toast(
                              'Enter your phone number');
                          return;
                        }

                        if (pass.isEmpty) {
                          UniversalMethods.show_toast(
                              'Enter your Gemini password');
                          return;
                        }

                        showLoaderDialog(context, 'Authenticating');


                        _login(name,pass);


                      },

                      // color: HexColor('#0F305E'),
                      // textColor: Colors.white,
                      child: Text(
                        "Login",
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



  _login(login_details, password) async{
    String x = await UserService().user_login(login_details,password);
    Navigator.of(context).pop();

    if(x=='NO'){
      UniversalMethods.show_toast('Invalid Username or password');
      return;
    }

    Phoenix.rebirth(context);

  }

  showLoaderDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("${message}...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
