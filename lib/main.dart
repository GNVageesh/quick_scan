import 'package:quick_scan/Utilities/constants.dart';
import 'package:quick_scan/screens/about_screen.dart';
import 'package:quick_scan/screens/home_screen.dart';
import 'package:quick_scan/screens/scan_document.dart';
import 'package:quick_scan/screens/view_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'screens/pdf_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  runApp(OpenScan());
}

class OpenScan extends StatefulWidget {
  @override
  _OpenScanState createState() => _OpenScanState();
}

class _OpenScanState extends State<OpenScan> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: secondaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: CupertinoColors.activeOrange,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        ViewDocument.route: (context) => ViewDocument(),
        PDFScreen.route: (context) => PDFScreen(),
        ScanDocument.route: (context) => ScanDocument(),
        AboutScreen.route: (context) => AboutScreen(),
      },
    );
  }
}
