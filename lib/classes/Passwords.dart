class Password {
  int id;
  String password;
  String
      passwordPlatform; //describes the platform of password(twitter, instagram etc.)
  DateTime passwordCreationTime = DateTime.now();

  Password({this.id, this.password, this.passwordPlatform});
}
