import 'package:blm468_project/classes/User.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formRegisterKey = GlobalKey<FormState>();
  final pwdController = new TextEditingController();
  final pwdConfirmController = new TextEditingController();
  final userNameController = new TextEditingController();
  User newAccount = new User();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffc5c3c6),
      content: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: MediaQuery.of(context).size.width / 3,
              bottom: MediaQuery.of(context).size.height / 4,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 70),
              child: Form(
                key: _formRegisterKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 100),
                      child: Text("Username: "),
                    ),
                    TextFormField(
                      controller: userNameController,
                      onChanged: (value) {
                        setState(() {
                          newAccount.userName = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid Username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        hintText: "Enter Username",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 100),
                      child: Text("Password: "),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          newAccount.userPassword = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          pwdController.text = "";
                          return 'Please enter Password';
                        } else if (value != pwdConfirmController.text) {
                          pwdController.text = "";
                          return 'Passwords doesn\'t match!';
                        }
                        return null;
                      },
                      controller: pwdController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        hintText: "Enter Password",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 100),
                      child: Text("Confirm Password: "),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          pwdConfirmController.text = "";
                          return 'Please enter Password';
                        } else if (value != pwdController.text) {
                          pwdConfirmController.text = "";
                          return 'Passwords doesn\'t match!';
                        }
                        return null;
                      },
                      controller: pwdConfirmController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        hintText: "Confirm Password",
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 100),
                      child: RaisedButton(
                          color: Theme.of(context).buttonColor,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.button.color),
                          ),
                          onPressed: () {
                            if (_formRegisterKey.currentState.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Register Succesfull!"),
                                    );
                                  });
                              _formRegisterKey.currentState.save();
                              Navigator.of(context)
                                  .popUntil(ModalRoute.withName('/'));
                              //Database insert.
                            }
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetRegister() {
    setState(() {
      pwdController.text = "";
      pwdConfirmController.text = "";
      userNameController.text = "";
    });
  }
}
