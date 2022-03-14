import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/screens/custom_bottom_button.dart';
import 'package:gemini_app/screens/survey/survey_questions.dart';
import 'package:gemini_app/screens/universal_methods.dart';
import 'package:gemini_app/utils/user_service.dart';
import 'package:phone_number/phone_number.dart';

import '../../models/survey_models/survey_questions.dart';
import '../database_helper.dart';

class SurveyCreate extends StatefulWidget {
  @override
  State<SurveyCreate> createState() => _SurveyQuestionsState();
}

class _SurveyQuestionsState extends State<SurveyCreate> {
  var _name_controller = TextEditingController(text: '');
  var _phone_controller = TextEditingController(text: '');
  var _market_controller = TextEditingController(text: '');
  List<String> _markets = ['Select Market', 'Kangemi', 'Githurai', 'Dandora'];

  String _selectedmarket = 'Select Market';
  DatabaseHelper db = DatabaseHelper.instance;

  dynamic id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _get_string();
  }

  _get_string() async {
    List<Map> list = await db.get_user();
   // String user_id = '';
    list.forEach((element) {
      id = element['uid'];
    });

    return id;
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                controller: _name_controller,
                minLines: 1,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                  hintText: 'Full name',
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
                style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
              ),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _phone_controller,
                maxLength: 10,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                  hintText: 'Phone number',
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
                keyboardType: TextInputType.number,
                style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
              ),
              SizedBox(
                height: 32,
              ),
              // TextFormField(
              //   controller: _market_controller,
              //   minLines: 1,
              //   decoration: new InputDecoration(
              //     contentPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              //     hintText: 'Market',
              //     hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //       borderSide: BorderSide(
              //         color: Colors.grey[200],
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //       borderSide: BorderSide(
              //         color: Colors.grey[200],
              //         width: 1.0,
              //       ),
              //     ),
              //     //fillColor: Colors.green
              //   ),
              //   validator: (val) {
              //     if (val.length == 0) {
              //       return "Name cannot be empty";
              //     } else {
              //       return null;
              //     }
              //   },
              //   keyboardType: TextInputType.name,
              //   style: new TextStyle(fontFamily: "Poppins", fontSize: 12),
              // ),
              SizedBox(
                height: 32,
              ),

              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(
                    //     builder: (context) => SurveyQuestions(),
                    //   ),
                    // );
                    // return;

                    String name = _name_controller.text;
                    String phone = _phone_controller.text;
                    String market = _selectedmarket;
                    if (name.isEmpty) {
                      UniversalMethods.show_toast('Add name');
                      return;
                    }
                    if (phone.isEmpty) {
                      UniversalMethods.show_toast('Add phone');
                      return;
                    }
                    if (_selectedmarket == 'Select Market') {
                      UniversalMethods.show_toast('Add market');
                      return;
                    }
                    // PhoneNumberUtil plugin = PhoneNumberUtil();
                    // String springFieldUSASimpleNoRegion = '4175555470';
                    // RegionInfo region = RegionInfo(prefix: 254, name: 'KE', code: 'Kenya');
                    // bool isValid = await plugin.validate(phone, region.code);

                    bool valid =isValidPhoneNumber(phone);

                    if(!valid){
                      UniversalMethods.show_toast('Invalid phone');
                      return;
                    }



                   // return;
                    // RegionInfo region = RegionInfo('US', 1);
                    // String formatted = await PhoneNumberUtil().format(springFieldUSASimpleNoRegion, region.code); // (417) 555-5470
                    //
                    Map<String, String> requestbody = {
                      'full_name': name,
                      'phone': phone,
                      'market': market,
                      'user_id': '${id}',
                      'which_role': 'retailer'
                    };

                    print(requestbody);
                   // return;


                    UniversalMethods()
                        .showLoaderDialog(context, 'Creating please wait');
                    Map<String, dynamic> result =
                        await UserService().create_survey(requestbody);

                    if (result.isNotEmpty) {
                      print(result);
                      UniversalMethods.show_toast('Survey create successfully');
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SurveyQuestions(result['res']),
                        ),
                      );
                    } else {
                      Navigator.of(context).pop();
                      UniversalMethods.show_toast('An error occurred');
                    }
                  },
                  child:
                      CustomBottomButton('Create Survey', Icons.arrow_forward)),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidPhoneNumber(String string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }

    // You may need to change this pattern to fit your requirement.
    // I just copied the pattern from here: https://regexr.com/3c53v
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if(!string.startsWith('0')){
      return false;
    }

    if(string.length!=10){
      return false;
    }

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}
