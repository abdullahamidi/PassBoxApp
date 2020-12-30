import 'package:blm468_project/Requests/Request.dart';
import 'package:blm468_project/classes/Passwords.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  void initState() {
    request.getPasswords(5); //değişecek
    super.initState();
  }

  int selectedValue = 0;
  bool isObscure = true;
  final List<Password> passwords = dummyList();
  final _formRegisterKey = GlobalKey<FormState>();
  final passwordPlatformController = new TextEditingController();
  final passwordController = new TextEditingController();
  Password newPassword = new Password();
  Request request = new Request();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).cardTheme.color,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      showDialog(
                          useRootNavigator: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color(0xffc5c3c6),
                              content: SingleChildScrollView(
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left:
                                          MediaQuery.of(context).size.width / 3,
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              70),
                                      child: Form(
                                        key: _formRegisterKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          100),
                                              child: Text("Parola Başlığı: "),
                                            ),
                                            TextFormField(
                                              controller:
                                                  passwordPlatformController,
                                              onChanged: (value) {
                                                setState(() {
                                                  newPassword.passwordPlatform =
                                                      value;
                                                });
                                              },
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Parola başlığı kısmı boş kalamaz';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(12),
                                                isDense: true,
                                                hintText: "Parola Başlığı",
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          100),
                                              child: Text("Parola: "),
                                            ),
                                            TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  newPassword.password = value;
                                                });
                                              },
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  passwordController.text = "";
                                                  return 'Parola kısmı boş kalamaz';
                                                }
                                                return null;
                                              },
                                              controller: passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(12),
                                                isDense: true,
                                                hintText: "Parola",
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          100),
                                              child: RaisedButton(
                                                  color: Theme.of(context)
                                                      .buttonColor,
                                                  child: Text(
                                                    "Kaydet",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .button
                                                            .color),
                                                  ),
                                                  onPressed: () {
                                                    if (_formRegisterKey
                                                        .currentState
                                                        .validate()) {
                                                      setState(() {
                                                        passwords
                                                            .add(newPassword);
                                                      });
                                                      request.insertPassword(
                                                          newPassword);
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  "Parola başarıyla eklendi!"),
                                                            );
                                                          });
                                                      _formRegisterKey
                                                          .currentState
                                                          .save();
                                                      Navigator.of(context)
                                                          .popUntil(ModalRoute
                                                              .withName(
                                                                  '/password'));
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
                          });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Expanded(
                  child: ListView.separated(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 100),
                    itemCount: passwords.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          tileColor: Theme.of(context).cardTheme.color,
                          title: Text(
                            passwords[index].passwordPlatform,
                            style: TextStyle(color: Color(0xffe9c772)),
                          ),
                          subtitle: Text(
                            isObscure == true
                                ? '${passwords[index].password.replaceAll(RegExp(r"."), "*")}'
                                : passwords[index].password,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                color: Theme.of(context).iconTheme.color,
                                icon: Icon(
                                  Icons.copy,
                                ),
                                tooltip: "Copy",
                                onPressed: () {
                                  Clipboard.setData(new ClipboardData(
                                      text: passwords[index].password));
                                },
                              ),
                              IconButton(
                                color: Theme.of(context).iconTheme.color,
                                icon: Icon(
                                  Icons.delete,
                                ),
                                tooltip: "Delete",
                                onPressed: () {
                                  //delete function
                                  setState(() {
                                    passwords.removeAt(index);
                                  });
                                },
                              ),
                              IconButton(
                                color: Theme.of(context).iconTheme.color,
                                icon: Icon(
                                  Icons.update,
                                ),
                                tooltip: "Update",
                                onPressed: () {
                                  Clipboard.setData(new ClipboardData(
                                      text: passwords[index].password));
                                }, //update function
                              ),
                            ],
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  static List<Password> dummyList() {
    //örnek veriler
    List<Password> _dummy = new List<Password>();
    final Password pwd1 = new Password();
    final Password pwd2 = new Password();
    final Password pwd3 = new Password();
    final Password pwd4 = new Password();
    pwd1.password = "pwd1545465";
    pwd1.id = 1;
    pwd1.passwordPlatform = "Facebook";
    pwd2.id = 2;
    pwd2.password = "pwd25435345";
    pwd2.passwordPlatform = "Instagram";
    pwd3.id = 3;
    pwd3.password = "pwd3123123";
    pwd3.passwordPlatform = "Twitter";
    pwd4.id = 4;
    pwd4.password = "pwd4123124";
    pwd4.passwordPlatform = "Youtube";
    //örnek veriler
    _dummy.add(pwd1);
    _dummy.add(pwd2);
    _dummy.add(pwd3);
    _dummy.add(pwd4);
    return _dummy;
  }
}
