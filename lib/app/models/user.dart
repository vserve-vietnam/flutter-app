import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? id;
  String? vtid;
  String? name;
  String? email;
  String? token;

  User({required this.id, this.name, required this.email, required this.token});

  User.fromJson(dynamic data) {
    this.id = data['id'];
    this.name = data['name'];
    this.email = data['email'];
    this.token = data['token'];
  }

  toJson() => {"id": id, "email": email, "token": token, "name": name};
}
