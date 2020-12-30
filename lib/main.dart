import 'dart:io';
import 'dart:ui';
import 'package:blm468_project/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/PasswordScreen.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/password': (context) => PasswordScreen()
      },
      title: 'PassBox Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xffc5c3c6),
        buttonColor: Color(0xff46494c),
        //Palette : 38,70,83 - 42,157,143 - 233,196,106 - 244,162,97 - 231,11,81
        buttonTheme: ButtonThemeData(
            highlightColor: Color.fromRGBO(38, 70, 83, 1.0),
            textTheme: ButtonTextTheme.primary),

        hintColor: Color(0x994c5c68),
        errorColor: Color(0xff660708),
        cardTheme: CardTheme(
          color: Color(0xff4c5c68),
          elevation: 2.0,
        ),
        iconTheme: IconThemeData(color: Color(0xcce9c772)),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Color(0xff46494c)),
        primaryColor: Color(0xFF46494c),
        primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Color(0xffe9c772), fontSize: 24)),
        textTheme: TextTheme(
            button: TextStyle(color: Color(0xffe9c772)),
            subtitle1: TextStyle(
                //listviewitem-textboxtext
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff46494c)),
            bodyText2: TextStyle(
              //username-password
              fontSize: 16,
              fontWeight: FontWeight.w500,
              //color: Color(0xffe9c772)
            )),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
