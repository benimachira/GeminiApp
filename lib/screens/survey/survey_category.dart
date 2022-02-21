import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/screens/survey/survey_questions.dart';

class SurveyCategory extends StatelessWidget {
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
              largeTitle: Text('New Survey'),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: cat_list.length,
              itemBuilder: (context, index) {
                var list = cat_list[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SurveyQuestions(),
                      ),
                    );
                  },
                  child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16,left: 16),
                            width: 100,
                            child: Image.asset(
                              list['image'],
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list['title'],
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        list['sub'],
                                      ),
                                      SizedBox(height: 16,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              }),
        ),
      ),
    );
  }

  List cat_list = [
    {
      'image': 'assets/images/retailer_survey.jpeg',
      'title': 'Retailer',
      'sub': 'Individuals selling fresh produce for profit in local markets.'
    },
    {
      'image': 'assets/images/transporter_survey.jpeg',
      'title': 'Transporter',
      'sub': 'Business owners offering short/long haul transport of fresh produce.'
    },
    {
      'image': 'assets/images/warehouse.jpeg',
      'title': 'Warehouse',
      'sub': 'Business owners with storage facilities for storing fresh produce.'
    },
    {
      'image': 'assets/images/suplier.jpeg',
      'title': 'Supplier',
      'sub': 'Farm owners who grow and supply fresh produce for local markets.'
    }
  ];
}
