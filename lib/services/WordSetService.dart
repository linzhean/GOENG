import 'dart:ffi';

import 'package:goeng/dao/WordDAO.dart';
import 'package:goeng/dao/WordSetDAO.dart';
import 'package:goeng/entity/WordSet.dart';
import 'package:goeng/services/BaseService.dart';

class WordSetService extends BaseService<WordSet> {
  final WordSetDAO wordSetDAO;
  final WordDAO wordDAO;

  factory WordSetService() {
    final wordSetDAO = WordSetDAO();
    final wordDAO = WordDAO();
    return WordSetService.internal(wordDAO: wordDAO, wordSetDAO: wordSetDAO);
  }

  WordSetService.internal({required this.wordDAO, required this.wordSetDAO})
      : super(baseDAO: wordSetDAO);

  Future<WordSet> getById(int id) async {
    final wordSet = await wordSetDAO.getById(id);
    if (wordSet != null) {
      return WordSet.fromMap(wordSet);
    } else {
      return Future.error('查無此單字集');
    }
  }
}
