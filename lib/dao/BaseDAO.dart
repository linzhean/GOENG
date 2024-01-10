import 'package:goeng/entity/Entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class BaseDAO<T extends Entity> {
  late Db db;
  late DbCollection collection;

  BaseDAO({required Entity entity}) {
    db = Db("mongodb://localhost:27017/GOENG");
    print('BaseDAO');
    collection = db.collection(entity.collectionName);
  }

  Future<void> openConnection() async {
    await db.open();
    print('DB open');
  }

  Future<void> closeConnection() async {
    await db.close();
    print('DB close');
  }

  Future<void> save(T document) async {
    await collection.insert(document.toMap());
  }

  Future<Map<String, dynamic>?> getById(int id) async {
    final entity = await collection.findOne(where.eq('id', id));
    return entity;
  }

  Future<List<T>> searchAll() async {
    final cursor = collection.find();
    final results = await cursor.map((dynamic data) => data as T).toList();
    return results;
  }

  Future<List<T>> searchByCondition(Map<String, dynamic> query) async {
    final cursor = collection.find(query);
    final results = await cursor.map((dynamic data) => data as T).toList();
    return results;
  }

  Future<void> updateData(int id, String key, dynamic value) async {
    await collection.update(where.eq('id', id), modify.set(key, value));
  }

  Future<void> deleteData(int id) async {
    await collection.remove(where.eq('id', id));
  }
}
