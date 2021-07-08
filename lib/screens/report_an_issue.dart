import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_button.dart';

class ReportIssue extends StatefulWidget {
  @override
  _ReportIssueState createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  int _radioValue1 = -1;
  int correctScore = 0;

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
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      new Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Expanded(
                        child: new Text(
                          'Inventory does not match with the sales on the application',
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
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      new Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Expanded(
                        child: new Text(
                          'Produce received is ro en or damaged.',
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
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      new Radio(
                        value: 2,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      Expanded(
                        child: new Text(
                          'Lost contact with a member of the team',
                          style: new TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomButton(
        'REPORT A PROBLEM',
        Icons.arrow_forward,
        Colors.red
      )
    );
  }
}
