import 'package:blm468_project/Widgets/PasswordPage.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Password Box"),
          toolbarHeight: MediaQuery.of(context).size.height / 8,
          //todo : SearchBar eklenecek
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xffc5c3c6)),
          child: PasswordPage(),
        ));
  }
}
