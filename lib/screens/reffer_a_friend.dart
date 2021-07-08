import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini_app/screens/MyReferals.dart';
import 'package:gemini_app/screens/custom_bottom_button.dart';

class RefferAFriend extends StatelessWidget {
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
              largeTitle: Text('Refer a friend'),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Badge Type',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Unlock Team Leader badge',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MyRefferals(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.grey[300],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    // color: HexColor('#D60812'),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'My Referral History',
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Center(child: Text('1'))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'And you can both save KES 200',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text('Just share the link',
                          style: TextStyle(fontSize: 13)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 2,
              ),
              _separator(),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Center(child: Text('2'))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'They hit the road',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text('With KES 200 off', style: TextStyle(fontSize: 13)),
                    ],
                  )
                ],
              ),
              _separator(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        // color: HexColor('#D60812'),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Center(child: Text('2'))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have the savings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text('Then you get KES 200 off',
                          style: TextStyle(fontSize: 13)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          CustomBottomButton('ADD FROM CONTACTS', Icons.arrow_forward),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _separator() {
    return Flex(
      children: List.generate(3, (_) {
        return Container(
          margin: EdgeInsets.only(left: 16, bottom: 2, top: 2),
          width: 1,
          height: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        );
      }),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.vertical,
    );
  }
}
