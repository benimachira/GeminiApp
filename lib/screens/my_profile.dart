import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  Map<String, dynamic> data = {
    'name': 'Mama joy Maina',
    'email': 'abe@gmail.com',
    'id': 4,
    'phone': '07000004',
    'avatar': 'assets/images/avatars/pass_04.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage(data['avatar']),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                data['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                data['email'],
                style: TextStyle(color: Colors.blue, fontSize: 13),
              ),
              SizedBox(
                height: 32,
              ),
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biography',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'is simply dummy text of the printing and typese ing industry. '
                    'Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, '
                    'when an unknown printer took a galley of type and scrambled',
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Cumulative Profits',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        'KES 256,060',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Produce Sold',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        'KES 256,060',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Team ID',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        'Lang-Mohamend',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Joined',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        'Joined on: 12th April, 2021',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Order Cycles',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        '23 cycles',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
