import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/Splash/splash.dart';
import 'package:todo/core/theme/theme.dart';
import 'package:todo/layout/HomeLayout/HomeLayout.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: AppTheme.lightTheme,
      initialRoute: Splash.routeName ,
      routes:  {
         Splash.routeName:(context) =>Splash(),
        HomeLayout.routeName:(context) => HomeLayout()
      },
    ) ;
  }
}
