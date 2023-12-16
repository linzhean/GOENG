import 'package:flutter/material.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/model/Word.dart';
import 'package:goeng/services/parser/HtmlToStringParser.dart';

class WordView {
  final WordService wordService = const WordService();
  final parser = const HtmlToStringParser();
  final String word;

  const WordView(this.word);

  Widget wordArea() {
    return (FutureBuilder<Word>(
      future: wordService.getDefinition(word: word),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (!snapshot.hasData) {
          return const Center(
              child: Text(
            '查無此單字解釋',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
              child: Text(
            '連線失敗 error: ${snapshot.error} ${DateTime.now()}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
        } else {
          Word word = snapshot.data!;
          print("word: $word");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word.originalWord,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                word.partOfSpeech!,
                style: const TextStyle(fontSize: 20, color: Color(0xff343434)),
              ),
              const SizedBox(height: 10),
              const Divider(height: 1.0, color: Color(0xff141414)),
              const SizedBox(height: 10),
              Text(
                parser.extractPlainText(word.definition!),
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
            ],
          );
        }
      },
    ));
  }

  Widget exampleArea() {
    return (FutureBuilder<List<Word>>(
      future: wordService.searchExample(word: word),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (!snapshot.hasData) {
          return const Center(
              child: Text(
            '查無此單字例句',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
              child: Text(
            '連線失敗 error: ${snapshot.error} ${DateTime.now()}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
        } else {
          final words = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: words.length,
              itemBuilder: (context, index) {
                Word word = words[index];
                print(parser.extractPlainText(word.example!));
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        parser.extractPlainText(word.example!),
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xff000000)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                        height: 1.0,
                        indent: 10,
                        endIndent: 10,
                        color: Color(0xb42f2f2f)),
                    const SizedBox(height: 10)
                  ],
                );
              });
        }
      },
    ));
  }
}
