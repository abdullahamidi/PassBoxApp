import 'package:blm468_project/Requests/Request.dart';
import 'package:blm468_project/Widgets/RegisterPage.dart';
import 'package:flutter/material.dart';

import '../classes/User.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User loginAccount = new User();
  Request request = new Request();
  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 2.5),
        //height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formLoginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Username:",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your username!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  contentPadding: EdgeInsets.all(12),
                  isDense: true,
                  hintText: "Enter Username",
                  border: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(5.0)),
                  ),
                ),
                onChanged: (value) {
                  loginAccount.userName = value;
                  setState(() {});
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Text(
                "Password:",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 120),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password!';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  contentPadding: EdgeInsets.all(12),
                  isDense: true,
                  hintText: "Enter Password",
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    loginAccount.userPassword = value;
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              ButtonTheme(
                buttonColor: Theme.of(context).buttonColor,
                minWidth: MediaQuery.of(context).size.width / 4,
                child: RaisedButton(
                  onPressed: () {
                    if (_formLoginKey.currentState.validate()) {
                      // request
                      //     .authUser(
                      //         loginAccount.userName, loginAccount.userPassword)
                      //     .then((value) {
                      Navigator.of(context).pushNamed("/password");
                      _formLoginKey.currentState.save();
                      //});
                    } //check the account if is exist. (abdullah)
                  },
                  child:
                      Text("Login", style: Theme.of(context).textTheme.button),
                ),
              ),
              ButtonTheme(
                buttonColor: Theme.of(context).buttonColor,
                minWidth: MediaQuery.of(context).size.width / 4,
                child: RaisedButton(
                  onPressed: () {
                    //DB insert isteği at
                    showDialog(
                        useRootNavigator: false,
                        context: context,
                        builder: (BuildContext context) {
                          return RegisterPage();
                        });
                  },
                  child: Text("Register",
                      style: Theme.of(context).textTheme.button),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
