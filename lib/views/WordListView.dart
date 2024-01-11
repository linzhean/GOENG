import 'package:flutter/material.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/entity/Word.dart';
import 'package:goeng/pages/WordPage.dart';

class WordListView {
  final WordService wordService = WordService();

  WordListView();

   Widget wordListArea({
    required void Function(Word) onItemTap,
    required void Function(Word) onAddButtonTap,
  }) {
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
                if (index < words.length) {
                  Word word = words[index];
                  return GestureDetector(
                    onTap: () {
                      onItemTap(word);
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
                          trailing: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              onAddButtonTap(word);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  // 最後一個是 + 按鈕
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          onAddButtonTap(Word()); // 傳一個空的 Word 對象，表示 + 按鈕
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          );
        }
      },
    );
  }

  Future<void> pullRefresh() async {
    await wordListArea(onItemTap: (word) {}, onAddButtonTap: (word) {});
  }
}