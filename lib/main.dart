import 'package:flutter/material.dart';
import 'package:todo/Splash/splash.dart';
import 'package:todo/core/theme/theme.dart';
import 'package:todo/layout/HomeLayout/HomeLayout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/layout/Login/LoginView.dart';
import 'package:todo/layout/Register/Register.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        HomeLayout.routeName:(context) => HomeLayout(),
        LoginView.routeName:(context) => LoginView(),
        RegisterView.routeName:(context) => RegisterView()

      },
    ) ;
  }
}



























