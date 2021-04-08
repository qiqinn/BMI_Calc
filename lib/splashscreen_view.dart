import 'package:flutter/material.dart';
import 'package:bmi_calc/home_view.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){ 
    super.initState();
    startSplashScreen();
  }

  startSplashScreen(){
    var duration = const Duration(seconds: 2);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return MyApp();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
           begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff348f50), Color(0xff56b4d3)]
          )
        ),
        child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Image.asset(
            
            "images/ic_launcher.png",
            width: 100,
            height: 100,
            ),
          
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text('Kalkulator BMI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
           )
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text('v. 1.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
           ),
          ),
        ],        
      ),
    ),
    );
  }

}

