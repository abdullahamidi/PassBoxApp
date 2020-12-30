import 'dart:convert';
import 'dart:io';

import 'package:blm468_project/classes/Passwords.dart';
import 'package:blm468_project/classes/User.dart';
import 'package:http/http.dart' as http;

class Request {
  static User currentUser = new User();
  static List<Password> passwords = [];

  Future<void> getPasswords(int userId) async {
    try {
      var url = "https://localhost:44301/password/$userId";
      final response = await http.get(url);
      final data = json.decode(response.body);
      List<Password> tempList = [];
      data.forEach((a) {
        tempList.add(Password(
            id: a['id'],
            password: a['password'],
            passwordPlatform: a['passwordPlatform']));
      });
      passwords = tempList;
    } catch (error) {
      print(error);
    }
  }

  Future<void> authUser(String username, String password) async {
    const String url = "http://localhost:55174/user/authenticate";
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      "Authorization": basicAuth
    };

    await http
        .post(url,
            headers: headers,
            body: json.encode({'username': username, 'password': password}))
        .then((response) => currentUser = json.decode(response.body));
  }

  Future<void> insertPassword(Password password) async {
    const url = "https://localhost:44301/password";

    await http
        .post(url,
            headers: {"Content-Type": "application/json "},
            body: json.encode({
              'UserPassword': password.password,
              'PasswordType': password.passwordPlatform,
              'CreationDate': DateTime.now().toString(),
              'UserId': 1 //değişecek
            }))
        .then((_) {
      print("Parola eklendi.");
    });
  }
}
