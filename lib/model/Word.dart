import 'package:flutter/material.dart';

class Word {
  String? id;
  String originalWord;
  String? partOfSpeech;
  String? definition;
  String? example;

  // test

  Word(
      {this.id,
      required this.originalWord,
      this.partOfSpeech,
      this.definition,
      this.example});

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
