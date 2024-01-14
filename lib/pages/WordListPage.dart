import 'package:flutter/material.dart';
import 'package:goeng/entity/Word.dart';
import 'package:goeng/pages/UserPage.dart';
import 'package:goeng/pages/WordPage.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/views/WordListView.dart';
import 'package:goeng/views/WordListView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordListPage extends StatefulWidget {
  WordListPage({Key? key}) : super(key: key);

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    WordListContent(), // 首页
    UserPage(), // 账号
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GOENG',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: '賬號',
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getAccount() async {
    final tokenSP = await SharedPreferences.getInstance();
    String? account = tokenSP.getString('userName');
    String? userId = tokenSP.getString('userId');
    if (account != null && userId != null) {
      return {'userName': account, 'userId': userId};
    }
    throw Future.error('請先登入');
  }
}

class WordListContent extends StatefulWidget {
  WordListContent({super.key});
  String? userName;
  String? userId;

  @override
  State<WordListContent> createState() => _WordListContentState();
}

class _WordListContentState extends State<WordListContent> {
  @override
  void initState() {
    super.initState();
    loadAccount();
  }

  Future<void> loadAccount() async {
    try {
      final userMap = await getAccount();
      setState(() {
        widget.userName = userMap['userName'];
        widget.userId = userMap['userId'];
      }); // 通知 Flutter 重新構建 UI
    } catch (error) {
      // 處理錯誤，例如用戶尚未登入
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    WordListView wordListView = WordListView();
    final wordService = WordService();
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 18,
            ),
            child: TextField(
              onSubmitted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordPage(word: value),
                  ),
                );
              },
              controller: TextEditingController(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: '搜寻',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black,
            child: wordListView.wordListArea(
              onItemTap: (word) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WordPage(word: word.originalWord ?? ""),
                  ),
                );
              },
              onAddButtonTap: (word) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('確定要收藏嗎？'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            wordService.save(Word(
                              userId: widget.userId ??= '',
                              originalWord: word.originalWord,
                              definition: word.definition,
                              partOfSpeech: word.partOfSpeech
                            ));
                            Navigator.of(context).pop();
                          },
                          child: const Text('確定'),
                        ),
                        TextButton(
                          onPressed: () {
                            // 处理取消按钮的逻辑
                            Navigator.of(context).pop();
                          },
                          child: const Text('取消'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<Map<String, dynamic>> getAccount() async {
    final tokenSP = await SharedPreferences.getInstance();
    String? account = tokenSP.getString('userName');
    String? userId = tokenSP.getString('userId');
    if (account != null && userId != null) {
      return {'userName': account, 'userId': userId};
    }
    throw Future.error('請先登入');
  }
}
