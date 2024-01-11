import 'package:goeng/dao/BaseDAO.dart';
import 'package:goeng/entity/Word.dart';

class WordDAO extends BaseDAO<Word> {
  WordDAO() : super(entity: Word());

  // Future<List<Word>> searchByCondition(Map<String, dynamic> query) async {
  //   final cursor = collection.find(query);
  //   final results = await cursor.map((dynamic data) => data as Word).toList();
  //   print('DAO: ${results.toString()}');
  //   return results;
  // }
}
