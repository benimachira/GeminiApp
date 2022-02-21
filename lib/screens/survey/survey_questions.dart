import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SurveyQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
              ),
              largeTitle: Text('Retailer Acquisition Survey'),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16),
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              height: 100,
            );
          }),
        ),
      ),
    );
  }
}
