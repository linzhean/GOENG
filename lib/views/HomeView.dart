import 'package:flutter/material.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/model/Word.dart';
import 'package:goeng/pages/WordPage.dart';

class HomeView {
  final WordService wordService = const WordService();
  final String username; // Add a field to store the dynamic username

  const HomeView();

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
          ));
        } else {
          final words = snapshot.data!;
          return RefreshIndicator(
              onRefresh: pullRefresh,
              child: ListView.builder(
                itemCount: words.length + 1, // Add 1 for the dynamic username tile
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Display the dynamic username tile at the top
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                        child: ListTile(
                          title: Text(
                            username,
                            style: const TextStyle(
                              color: Color(0xff141414),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    Word word = words[index - 1];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WordPage(word: word.originalWord),
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
                              word.originalWord,
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
                  }
                },
              ));
        }
      },
    );
  }

  Future<void> pullRefresh() async {
    await wordListArea();
  }
}
