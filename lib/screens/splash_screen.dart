import 'dart:async';
import 'package:gemini_app/screens/login.dart';
import 'package:gemini_app/screens/screen_login_verify.dart';
import 'package:gemini_app/screens/survey/survey_home.dart';

import 'database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _anime_controller;
  DatabaseHelper db = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const anime_duration = 2;

    _anime_controller = AnimationController(
        duration: const Duration(seconds: anime_duration),
        reverseDuration: Duration(seconds: anime_duration),
        vsync: this);
    animation = Tween<double>(begin: 12, end: 20).animate(_anime_controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _anime_controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _anime_controller.forward();
      }
    });
    _anime_controller.forward();
  }

  _move_to_next() {
    const duration = 3;
    Timer(Duration(seconds: duration), () async {
      List<Map> list = await db.get_user();
      String token;
      int verify;
      String role;



      list.forEach((element) {
        print(element);
        token = element['access_token'];
        verify = element['verify'];
         role= element['user_role'];


      });



      if (list.length> 0 && token.isNotEmpty) {
        // if(verify==1){
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //       builder: (BuildContext context) => ScreenLoginVerify(),
        //     ),
        //   );
        // }else{

          if(role=='researcher'){
            print('${role} 2HHHHHHH ');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => HomeScreenSurvey(),
              ),
            );
          }else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen(),
              ),
            );
          }
       // }
        // Navigator.of(context).pushReplacement(
        //   // MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
        //   //
        //   //   MaterialPageRoute(
        //   //       builder: (BuildContext context) => HomeScreen()));
        //
        //
        //
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => HomeScreen(),
        //   ),
        // );
      } else {
        if (mounted) {
          Navigator.of(context).pushReplacement(
              // MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));

              MaterialPageRoute(builder: (BuildContext context) => Login()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _move_to_next();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: Text(
                'G',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _anime_controller.dispose();
    super.dispose();
  }
}
