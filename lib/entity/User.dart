import 'package:goeng/entity/Entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class User extends Entity {
  ObjectId? id;
  String? userId;
  String? userName;
  String? password;

  User({this.id, this.userId, this.userName, this.password})
      : super(collectionName: 'useraccount');

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'password': password
    };
  }

  @override
  User fromMap(Map<String, dynamic> map) {
    return User(
        id: map['\$oid'],
        userId: map['userId'],
        userName: map['userName'],
        password: map['password'])
      ..userId = map['userId'];
  }
}
