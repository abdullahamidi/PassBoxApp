import 'Passwords.dart';

class User {
  int id;
  String userName;
  String userPassword;
  DateTime registerDate = DateTime.now();
  List<Password>
      savedPasswordList; //List of passwords which is saved to the program
}
