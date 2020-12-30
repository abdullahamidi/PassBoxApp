import 'package:blm468_project/Widgets/LoginPage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Box Login Panel"),
        toolbarHeight: MediaQuery.of(context).size.height / 8,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffc5c3c6)),
        child: LoginPage(),
      ),
    );
  }
}
