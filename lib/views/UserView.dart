import 'package:goeng/entity/Word.dart';
import 'package:goeng/pages/WordListPage.dart';
import 'package:goeng/services/UserService.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/services/WordSetService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:goeng/entity/WordSet.dart';

class UserView {
  final wordSetService = WordSetService();
  final wordService = WordService();

  Widget getWordList(String userId) {
    return FutureBuilder(
        future: wordService.searchByCondition({'userId': userId}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '連線失敗 error: ${snapshot.error} ${DateTime.now()}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            final words = snapshot.data!;
            print('words: ${words.toString()}');
            return ListView.builder(
              itemCount: words.length + 1,
              itemBuilder: (context, index) {
                Word word = words[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordListPage(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                      child: ListTile(
                        title: Text(
                          word.originalWord ??= '',
                          style: const TextStyle(
                            color: Color(0xff141414),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }

  Widget getWordSetList(userId) {
    return FutureBuilder(
        future: wordSetService.searchByCondition({'userId': userId}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '連線失敗 error: ${snapshot.error} ${DateTime.now()}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            final wordSets = snapshot.data!;
            return ListView.builder(
              itemCount: wordSets.length + 1,
              itemBuilder: (context, index) {
                WordSet wordSet = wordSets[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordListPage(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                      child: ListTile(
                        title: Text(
                          wordSet.name ??= '',
                          style: const TextStyle(
                            color: Color(0xff141414),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
