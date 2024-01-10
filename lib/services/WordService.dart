import 'dart:convert';
import 'package:goeng/dao/WordDAO.dart';
import 'package:goeng/services/BaseService.dart';
import 'package:http/http.dart' as http;
import 'package:goeng/entity/Word.dart';

class WordService extends BaseService<Word> {
  final WordDAO wordDAO;
  final String baseUrl = 'https://api.wordnik.com/v4';
  final String apiKey = 'xkh0nee0u1yb9hvvmbxsuoofx770oip4uxz6uh1edb7u9rfef';
  final bool useCanonical = false;

  factory WordService() {
    final wordDAO = WordDAO();
    return WordService._internal(wordDAO);
  }

  WordService._internal(this.wordDAO) : super(baseDAO: wordDAO);

  Future<Word> getById(int id) async {
    final word = await wordDAO.getById(id);
    if (word != null) {
      return Word.fromMap(word);
    } else {
      return Future.error('查無此單字');
    }
  }

  Future<void> collectWord(int wordId, int wordSetId) async {
    await super.update(wordId, {'wordSetId': wordSetId});
  }

  Future<List<Word>> searchByWordSetId(int wordSetId) async {
    return await super.searchByCondition({'wordSetId': wordSetId});
  }

  Future<List<Word>> searchRandomWords({limit = 500}) async {
    String pathUrl = '$baseUrl/words.json/randomWords';
    final url = Uri.parse('$pathUrl?api_key=$apiKey&limit=$limit');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> wordList = json.decode(response.body);
      print(wordList);
      return wordList.map((json) => Word.fromRandomList(json)).toList();
    } else {
      throw Exception('連線失敗 ${response.body}');
    }
  }

  Future<Word> getDefinition({limit = 50, required String word}) async {
    String pathUrl = '$baseUrl/word.json/$word/definitions';
    print('pathUrl: $pathUrl');
    final url = Uri.parse(
        '$pathUrl?limit=$limit&api_key=$apiKey&useCanonical=$useCanonical');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> wordList = json.decode(response.body);
      return wordList
          .where((data) =>
              data.containsKey('word') &&
              data.containsKey('text') &&
              data.containsKey('partOfSpeech'))
          .map((json) => Word.fromDefinition(json))
          .toList()
          .first;
    } else {
      print('definition: ${response.body.toString()}');
      throw Exception('連線失敗 ${response.body}');
    }
  }

  Future<List<Word>> searchExample({limit = 50, required word}) async {
    String pathUrl = '$baseUrl/word.json/$word/examples';
    print('pathUrl: $pathUrl');
    final url = Uri.parse(
        '$pathUrl?limit=$limit&api_key=$apiKey&useCanonical=$useCanonical');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> example = json.decode(response.body);
      List<dynamic> wordList = example['examples'];
      return wordList
          .where((data) => data.containsKey('word') && data.containsKey('text'))
          .map((json) => Word.fromExample(json))
          .toList();
    } else {
      print("examples: ${response.body.toString()}");
      throw Exception('連線失敗 ${response.body}');
    }
  }
}
