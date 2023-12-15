import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:midtermproject/model/Word.dart';

class WordService {
  final String baseUrl = 'https://api.wordnik.com/v4';

  final String apiKey = 'xkh0nee0u1yb9hvvmbxsuoofx770oip4uxz6uh1edb7u9rfef';

  final bool useCanonical = false;

  const WordService();

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
