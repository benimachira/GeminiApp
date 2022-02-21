import 'dart:async';
import 'package:gemini_app/screens/login.dart';

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

  _move_to_next(){
    const duration = 3;
    Timer(Duration(seconds: duration), () async {

      String auth_token= await db.get_auth_token();
      if(auth_token.isNotEmpty){
        Navigator.of(context).pushReplacement(
          // MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
          //
          //   MaterialPageRoute(
          //       builder: (BuildContext context) => HomeScreen()));

      MaterialPageRoute(
      builder: (BuildContext context) => HomeScreen()));
      }else{
        if (mounted) {
          Navigator.of(context).pushReplacement(
            // MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));

              MaterialPageRoute(
                  builder: (BuildContext context) => Login()));
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    _move_to_next();
    return Scaffold(
      body: Center(
        child:      AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: Text('G',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
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
