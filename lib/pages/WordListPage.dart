import 'package:flutter/material.dart';
import 'package:goeng/entity/Word.dart';
import 'package:goeng/pages/UserPage.dart';
import 'package:goeng/pages/WordPage.dart';
import 'package:goeng/views/HomeView.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({Key? key}) : super(key: key);

  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    WordListContent(), // 首页
    UserPage(username: '王小明'), // 账号
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
        backgroundColor: Colors.transparent,
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
}

class WordListContent extends StatelessWidget {
  const WordListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeView homeView = HomeView();
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
            child: homeView.wordListArea(
              onItemTap: (word) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordPage(word: word.originalWord ?? ""),
                  ),
                );
              },
              onAddButtonTap: (word) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('确定要收藏吗？'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // 处理确定按钮的逻辑
                            Navigator.of(context).pop();
                          },
                          child: const Text('确定'),
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
}