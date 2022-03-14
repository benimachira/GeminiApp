import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/screens/custom_bottom_button.dart';
import 'package:gemini_app/screens/survey/survey_retailer_products.dart';
import 'package:gemini_app/utils/user_service.dart';

import '../../models/survey_models/survey_answer.dart';
import '../../models/survey_models/survey_questions.dart';
import '../database_helper.dart';
import '../universal_methods.dart';

class SurveyQuestions extends StatefulWidget {
  @override
  State<SurveyQuestions> createState() => _SurveyQuestionsState();

  int id;

  SurveyQuestions(int id) {
    this.id = id;
  }
}

class _SurveyQuestionsState extends State<SurveyQuestions> {
  List<TextEditingController> _controller = [];
  List answered = [];
  List<ModelSurveyQuestions> snap = [];
  DatabaseHelper db = DatabaseHelper.instance;

  List<String> _markets = ['Select one', 'Yes', 'No'];
  List<String> _grade = [
    'Select one',
    'None',
    'KCPE',
    'KCSE',
    'College',
    'Graduate'
  ];
  List<String> _collection = ['Select one', 'Collect', 'Deliver'];

  String _selectedmarket = 'Select one';
  String _q1 = 'Select one';

  String _selectedgrad = 'Select one';

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleAppLifecycleState();
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
          margin: EdgeInsets.only(right: 16, bottom: 64, left: 16, top: 16),
          child: FutureBuilder(
              future: UserService().load_survey(),
              builder: (context, snapshot) {
                snap = snapshot.data as List<ModelSurveyQuestions>;

                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        var _name_controller = TextEditingController();

                        _controller.add(_name_controller);
                        ModelSurveyQuestions questions = snap[index];



                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '${index + 1}. ${questions.question}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              questions.data_input_type == 'text'
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: _controller[index],
                                            decoration: new InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      16.0, 0, 16.0, 0),
                                              hintText: 'Answer',
                                              hintStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: BorderSide(
                                                  color: Colors.grey[200],
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        FutureBuilder(
                                            future: UserService().select_quiz(
                                                widget.id, questions.id),
                                            builder: (context, snapshot) {
                                              //  if (snapshot.hasData) {
                                              ModelSurveyAnswers x =
                                                  snapshot.data;

                                              // return Text('data${x.id}');

                                              if (x == null) {
                                                return InkWell(
                                                  child: Icon(
                                                    Icons.upload_outlined,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                  onTap: () async {
                                                    String x =
                                                        _controller[index].text;

                                                    if (x.isEmpty) {
                                                      UniversalMethods
                                                          .show_toast(
                                                              'Add answer');
                                                      return;
                                                    }

                                                    Map<String, String>
                                                        requestbody = {
                                                      'survey_id':
                                                          '${widget.id}',
                                                      'survey_question_id':
                                                          '${questions.id}',
                                                      'survey_question':
                                                          questions.question,
                                                      'survey_answer': x,
                                                      'save_data_type':
                                                          questions
                                                              .data_input_type,
                                                    };

                                                    UniversalMethods()
                                                        .showLoaderDialog(
                                                            context,
                                                            'Saving Answer');

                                                    int feed = await UserService()
                                                        .submit_survey_question(
                                                            requestbody);

                                                    if (feed == 1) {
                                                      UniversalMethods.show_toast(
                                                          'Question submitted');
                                                    } else {
                                                      UniversalMethods.show_toast(
                                                          'An error occurred');
                                                    }
                                                    Navigator.of(context).pop();

                                                    // showAlertDialog(requestbody);
                                                  },
                                                );
                                              } else {
                                                String xr =
                                                    x.survey_data['answer'];

                                                print(xr);

                                                TextEditingController xv =
                                                    TextEditingController(
                                                        text: xr);

                                                _controller[index].value =
                                                    TextEditingValue(text: xr);

                                                return Icon(
                                                  Icons.check,
                                                  size: 16,
                                                  color: Colors.green,
                                                );
                                              }

                                              // } else {
                                              //   return Icon(
                                              //     Icons.watch_later_rounded,
                                              //     size: 16,
                                              //     color: Colors.grey,
                                              //   );
                                              // }
                                            }),
                                      ],
                                    )
                                  : questions.data_input_type == 'selection'
                                      ? _drop_down(questions)
                                      : questions.data_input_type == 'clock'
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        new BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.grey[200]),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                      color: Colors.grey[100],
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        right: 16, left: 16),
                                                    height: 45,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            _selectTime(
                                                                context);
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Center(
                                                                child: Text(
                                                                  '${selectedTime.hour}:${selectedTime.minute}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                FutureBuilder(
                                                    future: UserService()
                                                        .select_quiz(widget.id,
                                                            questions.id),
                                                    builder:
                                                        (context, snapshot) {
                                                      //  if (snapshot.hasData) {
                                                      ModelSurveyAnswers x =
                                                          snapshot.data;

                                                      // return Text('data${x.id}');

                                                      // if (x == null) {
                                                      return InkWell(
                                                        child: Icon(
                                                          Icons.upload_outlined,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                        onTap: () async {
                                                          List<Map> x = await db
                                                              .get_survey();

                                                          if (x.length == 0) {
                                                            UniversalMethods
                                                                .show_toast(
                                                                    'O items');
                                                            return;
                                                          }

                                                          Map<String, dynamic>
                                                              requestbody = {
                                                            'survey_id':
                                                                '${widget.id}',
                                                            'survey_question_id':
                                                                '${questions.id}',
                                                            'survey_question':
                                                                questions
                                                                    .question,
                                                            'survey_answer':
                                                                '${x}',
                                                            'save_data_type':
                                                                questions
                                                                    .data_input_type,
                                                          };

                                                          UniversalMethods()
                                                              .showLoaderDialog(
                                                                  context,
                                                                  'Saving Answer');

                                                          int feed = await UserService()
                                                              .submit_survey_question(
                                                                  requestbody);

                                                          if (feed == 1) {
                                                            UniversalMethods
                                                                .show_toast(
                                                                    'Question submitted');

                                                            int feed = await db
                                                                .update_survey(
                                                                    widget.id);
                                                          } else {
                                                            UniversalMethods
                                                                .show_toast(
                                                                    'An error occurred');
                                                          }
                                                          Navigator.of(context)
                                                              .pop();

                                                          // showAlertDialog(requestbody);
                                                        },
                                                      );
                                                    }),
                                              ],
                                            )
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                          builder: (context) =>
                                                              SurveyRetailerProducts(
                                                                  widget.id),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          new BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[200]),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(8),
                                                        ),
                                                        color: Colors.grey[100],
                                                      ),
                                                      padding: EdgeInsets.only(
                                                          right: 16, left: 16),
                                                      height: 45,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder(
                                                              future: db
                                                                  .get_survey(),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                    .hasData) {
                                                                  List<Map>
                                                                      data =
                                                                      snapshot
                                                                          .data;

                                                                  return Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Center(
                                                                        child:
                                                                            Text(
                                                                          '${data.length} items added',
                                                                          style:
                                                                              TextStyle(color: data.length > 0 ? Colors.green : Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else if (snapshot
                                                                    .hasError) {
                                                                  print(snapshot
                                                                      .error);
                                                                  return Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Center(
                                                                        child:
                                                                            Text(
                                                                          'Error',
                                                                          style:
                                                                              TextStyle(color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  return Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Center(
                                                                        child:
                                                                            CircularProgressIndicator(),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }
                                                              }),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                FutureBuilder(
                                                    future: UserService()
                                                        .select_quiz(widget.id,
                                                            questions.id),
                                                    builder:
                                                        (context, snapshot) {
                                                      //  if (snapshot.hasData) {
                                                      ModelSurveyAnswers x =
                                                          snapshot.data;

                                                      // return Text('data${x.id}');

                                                      // if (x == null) {
                                                      return InkWell(
                                                        child: Icon(
                                                          Icons.upload_outlined,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                        onTap: () async {
                                                          List<Map> x = await db
                                                              .get_survey();

                                                          if (x.length == 0) {
                                                            UniversalMethods
                                                                .show_toast(
                                                                    'O items');
                                                            return;
                                                          }

                                                          Map<String, dynamic>
                                                              requestbody = {
                                                            'survey_id':
                                                                '${widget.id}',
                                                            'survey_question_id':
                                                                '${questions.id}',
                                                            'survey_question':
                                                                questions
                                                                    .question,
                                                            'survey_answer':
                                                                '${x}',
                                                            'save_data_type':
                                                                questions
                                                                    .data_input_type,
                                                          };

                                                          UniversalMethods()
                                                              .showLoaderDialog(
                                                                  context,
                                                                  'Saving Answer');

                                                          int feed = await UserService()
                                                              .submit_survey_question(
                                                                  requestbody);

                                                          if (feed == 1) {
                                                            UniversalMethods
                                                                .show_toast(
                                                                    'Question submitted');

                                                            int feed = await db
                                                                .update_survey(
                                                                    widget.id);
                                                          } else {
                                                            UniversalMethods
                                                                .show_toast(
                                                                    'An error occurred');
                                                          }
                                                          Navigator.of(context)
                                                              .pop();

                                                          // showAlertDialog(requestbody);
                                                        },
                                                      );
                                                      // } else {
                                                      //   String xr =
                                                      //       x.survey_data['answer'];
                                                      //   return Icon(
                                                      //     Icons.check,
                                                      //     size: 16,
                                                      //     color: Colors.green,
                                                      //   );
                                                      // }

                                                      // } else {
                                                      //   return Icon(
                                                      //     Icons.watch_later_rounded,
                                                      //     size: 16,
                                                      //     color: Colors.grey,
                                                      //   );
                                                      // }
                                                    }),
                                              ],
                                            ),

                              SizedBox(
                                height: 48,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //   Icon(Icons.sync,size: 16,color: Colors.grey,),
                              //   Icon(Icons.edit_outlined,size: 16,color: Colors.grey,),
                              // ],),
                              // SizedBox(height: 8,),
                              Divider(
                                color: Colors.grey[200],
                                thickness: .5,
                              )
                            ],
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text('Error'));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
          onTap: () {
            _end_survey(1);
          },
          child: CustomBottomButton('Complete Survey', Icons.arrow_forward)),
    );
  }

  _end_survey(state) async {
    UniversalMethods().showLoaderDialog(context, 'Completing survey');

    Map shat = {
      'survey_id': '${widget.id}',
      'status': 'complete',
      'is_eligible': '${state}',
    };

    int x = await UserService().complete_survey(shat);
    if (x == 0) {
      Navigator.pop(context);
      UniversalMethods.show_toast('An error has occurred');
      return;
    } else {
      Navigator.pop(context);
      Navigator.of(context).pop();
    }
  }

  Widget _drop_down(ModelSurveyQuestions questions) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: DropdownButton<String>(
                focusColor: Colors.white,
                value: questions.id == 7 ? _selectedgrad : _selectedmarket,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: questions.id == 7
                    ? _grade.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList()
                    : questions.id == 12
                        ? _collection
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList()
                        : _markets
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),

                onChanged: (String value) {
                  setState(() {


                    questions.id==1?_q1:_selectedmarket = value;
                    // _chosenValue = value;
                    //
                    //
                    // print(_chosenValue);
                  });
                },
              ),
            ),
            SizedBox(
              width: 16,
            ),
            FutureBuilder(
                future: UserService().select_quiz(widget.id, questions.id),
                builder: (context, snapshot) {
                  //  if (snapshot.hasData) {
                  ModelSurveyAnswers x = snapshot.data;

                  // return Text('data${x.id}');

                  if (x == null) {
                    return InkWell(
                      child: Icon(
                        Icons.upload_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onTap: () async {
                        String val = questions.id==1?_q1:_selectedmarket;

                        if (val == 'Select one') {
                          UniversalMethods.show_toast('Select one');
                          return;
                        }

                        if (questions.id == 1 && val == 'No') {
                          await _end_survey(1);
                          UniversalMethods.show_toast('Survey ended');
                          Navigator.pop(context);
                          Navigator.of(context).pop();
                          return;
                        }
                        if (questions.id == 2 && val == 'No') {
                          await _end_survey(1);
                          UniversalMethods.show_toast('Survey ended');
                          Navigator.pop(context);
                          Navigator.of(context).pop();
                          return;
                        }
                        if (questions.id == 2 && val == 'No') {
                          await _end_survey(1);
                          UniversalMethods.show_toast('Survey ended');
                          Navigator.pop(context);
                          Navigator.of(context).pop();
                          return;
                        }

                        Map<String, dynamic> requestbody = {
                          'survey_id': '${widget.id}',
                          'survey_question_id': '${questions.id}',
                          'survey_question': val,
                          'survey_answer': '${x}',
                          'save_data_type': questions.data_input_type,
                        };

                        UniversalMethods()
                            .showLoaderDialog(context, 'Saving Answer');

                        int feed = await UserService()
                            .submit_survey_question(requestbody);

                        if (feed == 1) {
                          UniversalMethods.show_toast('Question submitted');

                          int feed = await db.update_survey(widget.id);
                        } else {
                          UniversalMethods.show_toast('An error occurred');
                        }
                        Navigator.of(context).pop();

                        // showAlertDialog(requestbody);
                      },
                    );
                  } else {
                    ModelSurveyAnswers ans = snapshot.data;
                    setState(() {
                      _q1=ans.survey_data['answer'];
                    });


                    return Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.green,
                    );


                  }
                }),
          ],
        ),
        //SizedBox(height: 16,),
      ],
    );
  }

  // _quiz (ModelSurveyQuestions questions)async{
  //   await UserService().select_quiz(widget.id, questions.id);
  //   setState(() {
  //
  //   });
  // }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  showAlertDialog(Map<String, String> req_body) async {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        // Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Ok",
        style: TextStyle(),
      ),
      onPressed: () async {
        Navigator.pop(context);
        UniversalMethods().showLoaderDialog(context, 'Saving Answer');

        int feed = await UserService().submit_survey_question(req_body);
        print(feed);
        if (feed == 1) {
          // // await OutputService().upload_a_prescription(path, file_name);
          Navigator.of(context).pop();

          UniversalMethods.show_toast('Question submitted');
          // Navigator.pop(context);

          setState(() {});

          return;
        } else {
          UniversalMethods.show_toast('An error occured');
          return;
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Confirm Saving",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      content: Text(
        'Confirm you want to this answer',
        style: TextStyle(fontSize: 13),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    Navigator.pop(context);
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
