import 'package:goeng/dao/BaseDAO.dart';
import 'package:goeng/entity/Word.dart';

class WordDAO extends BaseDAO<Word> {
  WordDAO():super(entity: Word());
}
