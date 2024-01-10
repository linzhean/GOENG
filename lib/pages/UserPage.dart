import 'package:flutter/material.dart';
import 'package:goeng/pages/HomePage.dart';
import 'package:goeng/pages/WordPage.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/views/HomeView.dart';

class WordSet {
  final String setName;
  final List<String> words;
  final bool showAddButton;

  WordSet(this.setName, this.words, {this.showAddButton = false});
}

class UserPage extends StatefulWidget {
  final String username; // 在 UserPage 中定義 username
  const UserPage({Key? key, required this.username}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late HomeView homeView;
  double fem = 1.0;
  double ffem = 1.0;

  // Replace this with your actual data source or logic   
  List<WordSet> wordSets = [];
  String username = '王小明'; // Replace with dynamic username

  @override
  void initState() {
    super.initState();
    homeView = HomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xfc000000),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(17 * fem, 20 * fem, 17 * fem, 48 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 25 * fem),
                    child: Text(
                      widget.username, // 使用 widget 取得父 Widget 的屬性
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 18 * fem),
                    child: Text(
                      'GOENG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  // Search bar
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 28 * fem),
                    padding: EdgeInsets.fromLTRB(
                        20 * fem, 10 * fem, 20 * fem, 10 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16 * fem,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24 * fem,
                        ),
                      ],
                    ),
                  ),
                  // Add button
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: IconButton(
                      onPressed: () {
                        _showAddWordSetDialog(context);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30.0,
                        color: Color(0xFF450455),
                      ),
                    ),
                  ),
                  // WordSet list
                  Column(
                    children: wordSets.map((wordSet) {
                      return GestureDetector(
                        onTap: () {
                          // Handle WordSet click, navigate to WordListPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(
                                  // Pass any additional data needed
                                  ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    wordSet.setName,
                                    style: const TextStyle(
                                      color: Color(0xff141414),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddWordSetDialog(BuildContext context) async {
    String setName = ''; // Variable to store the new set name

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('增加新群組'),
          content: TextField(
            onChanged: (value) {
              setName = value;
            },
            decoration: const InputDecoration(hintText: '輸入名稱'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // Add the new WordSet
                setState(() {
                  wordSets.add(WordSet(setName, []));
                });
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('建立'),
            ),
          ],
        );
      },
    );
  }
}
