import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemini_app/screens/survey/survey_questions.dart';
import 'package:gemini_app/screens/universal_methods.dart';
import 'package:gemini_app/utils/user_service.dart';
import 'package:intl/intl.dart';

import '../../models/survey_models/survey_cat_question.dart';
import '../database_helper.dart';
import '../my_orders_summary.dart';

class MySurvey extends StatefulWidget {
  @override
  _MySalesState createState() => _MySalesState();
}

class _MySalesState extends State<MySurvey> {
  AnimationController controller;
  Animation<Offset> offset;

  dynamic id;
  DatabaseHelper db = DatabaseHelper.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleAppLifecycleState();
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
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('My Surveys'),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: UserService().load_my_survey(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ModelSurveyCatQuestions> snap =
                          snapshot.data as List<ModelSurveyCatQuestions>;

                      if (snap.isNotEmpty) {
                        return Container(
                          margin: EdgeInsets.only(right: 16, left: 16),
                          child: ListView.builder(
                            itemCount: snap.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              ModelSurveyCatQuestions cat = snap[index];
                              // String  date =  DateFormat('dd-MM-yyyy').parse(cat.created_at);

                              // var date = new DateFormat("dd-MM-yyyy").parse(cat.created_at);

                              DateTime dt = DateTime.parse(cat.created_at);
                              String date = DateFormat('dd-MM-yyyy').format(dt);

                              return Column(
                                children: [
                                  InkWell(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(bottom: 16, top: 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  '#${cat.id}',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '${cat.full_name}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '${cat.which_role}',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${date}',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.blue),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              cat.survey_complete=='processing'
                                                  ? Icon(
                                                      Icons.watch_later_rounded,
                                                      size: 16,
                                                      color: Colors.grey,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      size: 16,
                                                      color: Colors.green,
                                                    ),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      print('HHHHHHHH ${cat.id}');

                                      if (cat.survey_complete == 'processing') {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                SurveyQuestions(cat.id),
                                          ),
                                        );
                                      } else {
                                        UniversalMethods.show_toast(
                                            'This survey is complete');
                                      }
                                    },
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return Container(
                          child: Center(
                            child: Text('No survey available'),
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Container(
                        child: Center(
                          child: Text('An error has occurred'),
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  handleAppLifecycleState() {
    AppLifecycleState _lastLifecyleState;
    SystemChannels.lifecycle.setMessageHandler((msg) {
      print('SystemChannels> $msg');

      switch (msg) {
        case "AppLifecycleState.paused":
          _lastLifecyleState = AppLifecycleState.paused;
          break;
        case "AppLifecycleState.inactive":
          _lastLifecyleState = AppLifecycleState.inactive;
          break;
        case "AppLifecycleState.resumed":
          _lastLifecyleState = AppLifecycleState.resumed;
          break;

        default:
      }
    });
  }
}
