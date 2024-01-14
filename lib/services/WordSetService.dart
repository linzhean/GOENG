import 'dart:ffi';

import 'package:goeng/dao/WordDAO.dart';
import 'package:goeng/dao/WordSetDAO.dart';
import 'package:goeng/entity/WordSet.dart';
import 'package:goeng/services/BaseService.dart';
import 'package:mongo_dart/mongo_dart.dart';

class WordSetService extends BaseService<WordSet> {
  final WordSetDAO wordSetDAO;
  final WordDAO wordDAO;

  factory WordSetService() {
    final wordSetDAO = WordSetDAO();
    final wordDAO = WordDAO();
    final service =
        WordSetService.internal(wordDAO: wordDAO, wordSetDAO: wordSetDAO);
    service.baseDAO = wordSetDAO;
    return service;
  }

  WordSetService.internal({required this.wordDAO, required this.wordSetDAO})
      : super();

  Future<WordSet> getById(ObjectId id) async {
    final data = await wordSetDAO.getById(id);
    if (data != null) {
      final wordSet = WordSet();
      return wordSet.fromMap(data);
    } else {
      return Future.error('查無此單字集');
    }
  }
}
