import 'package:goeng/dao/UserDAO.dart';
import 'package:goeng/entity/User.dart';
import 'package:goeng/services/BaseService.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

class UserService extends BaseService<User> {
  final secretKey =
      'n#W|c{oU7NmuoHncu0\sV|ZyC8nq[{nQ@b:AF:fxDv9Km@tM0c=\-3A)eVrP6';
  final UserDAO userDAO;

  factory UserService() {
    final userDAO = UserDAO();
    final service = UserService._internal(userDAO);
    service.baseDAO = userDAO;
    return service;
  }

  UserService._internal(this.userDAO) : super();

  Future<User> getById(ObjectId objectId) async {
    final user = await userDAO.getById(objectId);
    if (user != null) {
      return User.fromMap(user);
    } else {
      return Future.error('查無此使用者');
    }
  }

  Future<Map<String, dynamic>> loginUser(String userId, String password) async {
    await userDAO.openConnection();
    final user = await userDAO.loginUser(userId, password);
    if (user != null) {
      final token = generateToken(user);
      userDAO.closeConnection();
      print('token: $token');
      return {'token': token, 'userName': user.userName};
    }
    userDAO.closeConnection();
    return Future.error('登入失敗, 請檢查帳號密碼是否輸入正確');
  }

  String generateToken(User user) {
    final token = JWT({
      'userId': user.userId,
      'username': user.userName,
      'exp':
          DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000,
    });
    return token.sign(SecretKey(secretKey));
  }
}
