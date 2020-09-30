import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_scan/Utilities/constants.dart';
import 'package:quick_scan/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String route = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visitingFlag = false;

  Future<void> getFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("alreadyVisited") == null) {
      visitingFlag = false;
    } else {
      visitingFlag = true;
    }
    await preferences.setBool('alreadyVisited', true);
  }

  Timer getTimerWid() {
    return Timer(Duration(seconds: 1), () {
      (visitingFlag)
          ? Navigator.of(context).pushReplacementNamed(HomeScreen.route)
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
    });
  }

  getFlagInfo() async {
    await getFlag();
  }

  @override
  void initState() {
    super.initState();
    getFlagInfo();
    getTimerWid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 7,
            ),
            CircleAvatar(
              backgroundColor: primaryColor,
              child: new Container(
                child: Image.asset('assets/ic_launcher.png'),
              ),
              radius: 130,
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                text: 'Quick',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(text: 'Scan', style: TextStyle(color: Colors.cyan))
                ],
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Made By GNV',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
