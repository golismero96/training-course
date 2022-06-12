
class User {
  int? _id;
  String? _name;
  String? _family;
  String? _mobile;

  User({required int id, required String name, required String family, required String mobile}) {
    this._id = id;
    this._name = name;
    this._family = family;
    this._mobile = mobile;
  }

  static Future<User> authenticate(String username, String password) async {
    return Future.delayed(const Duration(seconds: 2), () {
      return User(id: 1, name: "mostafa", family: "dadfar", mobile: "099905274776");
    });
  }
}