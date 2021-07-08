import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_app/screens/colors.dart';

import 'custom_color.dart';
import 'custom_data.dart';

var color_purple = ColorsLocal.color_purple;
var color_orange = ColorsLocal.color_orange;
var color_blue = ColorsLocal.color_blue;
var color_green = Colors.green;

class Notifications extends StatelessWidget {
  List<Map<String, dynamic>> notificatio_data = CustomData().notification_date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              largeTitle: Text('Notifications'),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: notificatio_data.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = notificatio_data[index];
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(color: Colors.grey, width: .2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              // color: HexColor('#D60812'),
                            ),
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              data['icon_not'],
                              width: 24,
                              height: 24,
                              color: HexColor(data['not_type'] == 1
                                  ? color_orange
                                  : data['not_type'] == 2
                                      ? color_blue
                                      : color_purple),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      data['title'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[800]),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      data['text'],
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    data['action_required'] == 1
                                        ? Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: new BoxDecoration(
                                                  color: Colors.grey[100],
                                                  border: Border.all(
                                                      color: Colors.grey[300],
                                                      width: .2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  ),
                                                ),
                                                child: Text(
                                                  data['action_message'],
                                                  style: TextStyle(
                                                      color: Colors.grey[600]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                data['time'],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        : Container(
                                            child: Text(
                                              data['time'],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
