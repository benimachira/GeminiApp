import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/screens/custom_data.dart';

import 'custom_bottom_button.dart';

class ReportIssue extends StatefulWidget {
  int route_id;

  ReportIssue(route_id) {
    this.route_id = route_id;
    print(route_id);
  }

  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  int _radioValue1 = -1;
  int correctScore = 0;
  int icoming;

  List _issue_list = CustomData.issues;
  List _searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _issue_list.forEach((p) {
      if (p['action'] == widget.route_id) {
        _searchList.add(p);
      }
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          correctScore++;
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
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
              largeTitle: Text('Report Issue'),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Raise a ticket by selection an issue',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
              itemCount: _searchList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        new Radio(
                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        Expanded(
                          child: new Text(
                            _searchList[index]['name'],
                            style: new TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Divider(
                      color: Colors.grey[200],
                    ),
                  ],
                );
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomButton(
          'REPORT A PROBLEM', Icons.arrow_forward, Colors.red),
    );
  }
}
