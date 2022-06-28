// ignore_for_file: file_names

class User {
  int? _id;
  String? _name;
  String? _family;
  String? _mobile;
  String? _password;

  User({required int id, required String name, required String family, required String mobile, required String password}) {
    this._id = id;
    this._name = name;
    this._family = family;
    this._mobile = mobile;
    this._password = password;
  }

  static Future<User> authenticate(String username, String password) async {
    return Future.delayed(const Duration(seconds: 2), () {
      return User(id: 1, name: username, family: "dadfar", mobile: "099905274776", password: password);
    });
  }
}