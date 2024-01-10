import 'package:goeng/dao/BaseDAO.dart';
import 'package:goeng/entity/Entity.dart';

class BaseService<T extends Entity> {
  late final BaseDAO<T> baseDAO;

  BaseService({required BaseDAO<T> baseDAO});

  Future<void> save(T document) async {
    baseDAO.openConnection();
    await baseDAO.save(document);
    baseDAO.closeConnection();
  }

  Future<List<T>> searchAll() async {
    baseDAO.openConnection();
    final TList = baseDAO.searchAll() as List<T>;
    baseDAO.closeConnection();
    return TList;
  }

  Future<List<T>> searchByCondition(Map<String, dynamic> query) async {
    baseDAO.openConnection();
    final results = await baseDAO.searchByCondition(query) as List<T>;
    baseDAO.closeConnection();
    return results;
  }

  Future<void> update(int id, Map<String, dynamic> updateData) async {
    baseDAO.openConnection();
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
      baseDAO.closeConnection();
      return Future.error('找不到資料, id = $id');
    }
    baseDAO.closeConnection();
  }

  Future<void> delete(int id) async {
    baseDAO.openConnection();
    await baseDAO.deleteData(id);
    baseDAO.closeConnection();
  }

  static Future<T> executeWithDbErrorHandling<T>(
      Future<T> Function() action, BaseDAO baseDAO) async {
    try {
      return await action();
    } catch (error) {
      print('Error occurred: $error');
      baseDAO.closeConnection();
      rethrow;
    }
  }
}
