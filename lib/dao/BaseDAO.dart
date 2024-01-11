import 'package:goeng/entity/Entity.dart';
import 'package:goeng/entity/Word.dart';
import 'package:mongo_dart/mongo_dart.dart';

class BaseDAO<T extends Entity> {
  static late Db db =  Db("mongodb://localhost:27017/GOENG");
  late DbCollection collection;

  BaseDAO({required Entity entity}) {
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

  Future<Map<String, dynamic>?> getById(ObjectId id) async {
    final entity = await collection.findOne(where.eq('id', id));
    return entity;
  }

  Future<List<T>> searchAll() async {
    final cursor = collection.find();
    final results = await cursor.map((dynamic data) => data as T).toList();
    return results;
  }

  Future<List<T>> searchByCondition(Map<String, dynamic> query) async {
    final cursor = await collection.find(where.eq('userId', query['userId']));
    final results = await cursor.map((dynamic data) => data as T).toList();
    return results;
  }

  Future<void> updateData(ObjectId id, String key, dynamic value) async {
    await collection.update(where.eq('id', id), modify.set(key, value));
  }

  Future<void> deleteData(int id) async {
    await collection.remove(where.eq('id', id));
  }
}
