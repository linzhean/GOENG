import 'package:goeng/entity/Entity.dart';

class User extends Entity {
  String? userId;
  String? userName;
  String? password;

  User({this.userId, this.userName, this.password})
      : super(collectionName: 'useraccount');

  @override
  Map<String, dynamic> toMap() {
    return {'userId': userId, 'username': userName, 'password': password};
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(userId: map['userId'], userName: map['username'], password: map['password'])
      ..userId = map['userId'];
  }
}
