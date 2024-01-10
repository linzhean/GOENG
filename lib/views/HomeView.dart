import 'package:flutter/material.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/entity/Word.dart';
import 'package:goeng/pages/WordPage.dart';

class HomeView {
  final WordService wordService = WordService();

  HomeView();

  Widget wordListArea() {
    return FutureBuilder<List<Word>>(
      future: wordService.searchRandomWords(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '連線失敗 error: ${snapshot.error} ${DateTime.now()}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          final words = snapshot.data!;
          return RefreshIndicator(
            onRefresh: pullRefresh,
            child: ListView.builder(
              itemCount: words.length + 1,
              itemBuilder: (context, index) {
                Word word = words[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WordPage(word: word.originalWord ??= ''),
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
            ),
          );
        }
      },
    );
  }

  Future<void> pullRefresh() async {
    await wordListArea();
  }
}
