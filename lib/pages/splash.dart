import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:SplashScreen(
        seconds: 5,
        image:Image.asset('assets/icon.png'),
        photoSize: 180.0,
        navigateAfterSeconds: Home(),
          loaderColor: Color(0xFF9C560B),
        backgroundColor: Colors.white,
      ),
    );
  }
}
