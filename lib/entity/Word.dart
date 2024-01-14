import 'package:goeng/entity/Entity.dart';

class Word extends Entity {
  int? id;
  int? wordSetId;
  String? userId;
  String? originalWord;
  String? partOfSpeech;
  String? definition;
  String? example;

  Word(
      {this.id,
      this.wordSetId,
      this.userId,
      this.originalWord,
      this.partOfSpeech,
      this.definition,
      this.example})
      : super(collectionName: 'word');

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'wordSetId': wordSetId,
      'userId': userId,
      'originalWord': originalWord,
      'partOfSpeech': partOfSpeech,
      'definition': definition,
      'example': example
    };
  }

  @override
  Word fromMap(Map<String, dynamic> map) {
    return Word(
        id: map['id'],
        wordSetId: map['wordSetId'],
        userId: map['userId'],
        originalWord: map['originalWord'],
        partOfSpeech: map['partOfSpeech'],
        definition: map['definition'],
        example: map['example'])
      ..id = map['id'];
  }

  factory Word.fromRandomList(Map<String, dynamic> data) {
    return Word(
      originalWord: data['word'],
    );
  }

  factory Word.fromDefinition(Map<String, dynamic> data) {
    return Word(
        originalWord: data['word'],
        partOfSpeech: data['partOfSpeech'],
        definition: data['text']);
  }

  factory Word.fromExample(Map<String, dynamic> data) {
    return Word(originalWord: data['word'], example: data['text']);
  }
}
