import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryColor= const Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(


  primaryColor: primaryColor,
    appBarTheme: AppBarTheme(

        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 150,
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 22,
        )),

    scaffoldBackgroundColor: Color(0xffDFECDB),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff5D9CEC) ,

    onPrimary: const Color(0xff5D9CEC),

    ),


    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 18, color: primaryColor , fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.poppins(
          fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(color:primaryColor),
      selectedItemColor: primaryColor ,
      unselectedIconTheme: IconThemeData( color: Colors.grey),
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData( backgroundColor: primaryColor)
  );





  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30,
        )),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
    ),

  );


}
