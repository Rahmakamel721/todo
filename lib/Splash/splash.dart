import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/layout/HomeLayout/HomeLayout.dart';
import 'package:todo/layout/Login/LoginView.dart';

class Splash extends StatelessWidget {
  static const routeName='splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () { Navigator.pushReplacementNamed(context, LoginView.routeName);});
    return Scaffold( body:
      Image.asset('assets/image/splash_light.png',fit: BoxFit.fill),




      );
  }
}
