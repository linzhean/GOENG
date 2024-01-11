import 'package:goeng/dao/BaseDAO.dart';
import 'package:goeng/entity/User.dart';

class UserDAO extends BaseDAO<User> {
  UserDAO() : super(entity: User());

  Future<void> registerUser(User user) async {
    await collection.insert(user.toMap());
  }

  Future<User?> loginUser(String userId, String password) async {
    final query = {'userId': userId, 'password': password};
    final user = await collection.find(query).first;
    print(user);
    return User.fromMap(user);
  }
}
