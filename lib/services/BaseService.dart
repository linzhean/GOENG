import 'package:goeng/dao/BaseDAO.dart';
import 'package:goeng/entity/Entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class BaseService<T extends Entity> {
  late final BaseDAO<T> baseDAO;

  BaseService();

  Future<void> save(T document) async {
    await baseDAO.openConnection();
    await baseDAO.save(document);
    await baseDAO.closeConnection();
  }

  Future<List<T>> searchAll() async {
    await baseDAO.openConnection();
    final TList = baseDAO.searchAll() as List<T>;
    await baseDAO.closeConnection();
    return TList;
  }

  Future<List<T>> searchByCondition(Map<String, dynamic> query) async {
    await baseDAO.openConnection();
    final results = await baseDAO.searchByCondition(query) as List<T>;
    await baseDAO.closeConnection();
    return results;
  }

  Future<void> update(ObjectId id, Map<String, dynamic> updateData) async {
    await baseDAO.openConnection();
    Map<String, dynamic>? originData = await baseDAO.getById(id);
    if (originData != null) {
      for (var entry in updateData.entries) {
        var key = entry.key;
        var value = entry.value;
        if (originData.containsKey(key)) {
          await baseDAO.updateData(id, key, value);
        }
      }
    } else {
      await baseDAO.closeConnection();
      return Future.error('找不到資料, id = $id');
    }
    await baseDAO.closeConnection();
  }

  Future<void> delete(int id) async {
    await baseDAO.openConnection();
    await baseDAO.deleteData(id);
    await baseDAO.closeConnection();
  }

  static Future<T> executeWithDbErrorHandling<T>(
      Future<T> Function() action, BaseDAO baseDAO) async {
    try {
      return await action();
    } catch (error) {
      print('Error occurred: $error');
      await baseDAO.closeConnection();
      rethrow;
    }
  }
}
