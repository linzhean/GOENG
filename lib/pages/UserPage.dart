import 'package:flutter/material.dart';
import 'package:goeng/entity/User.dart';
import 'package:goeng/entity/WordSet.dart';
import 'package:goeng/pages/WordListPage.dart';
import 'package:goeng/pages/WordPage.dart';
import 'package:goeng/services/UserService.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/services/WordSetService.dart';
import 'package:goeng/views/UserView.dart';
import 'package:goeng/views/WordListView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:goeng/UserProvider.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  String? account;
  String? userId;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userView = UserView();
  final userService = UserService();
  final wordSetService = WordSetService();
  double fem = 1.0;
  double ffem = 1.0;

  @override
  void initState() {
    super.initState();
    loadAccount();
  }

  Future<void> loadAccount() async {
    try {
      // final userProvider = Provider.of<UserProvider>(context);
      // final userId = userProvider.userId;
      // if (userId != null) {
      //   final user = await userService.getById(userId);
      //   if (user != null) {
      //     widget.account = user.userName;
      //   }
      //   wordSetsWidget = userView.getWordSetList(userId);
      // }
      final userMap = await getAccount();
      setState(() {
        widget.account = userMap['userName'];
        widget.userId = userMap['userId'];
      }); // 通知 Flutter 重新構建 UI
    } catch (error) {
      // 處理錯誤，例如用戶尚未登入
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final wordSetsWidget = userView.getWordSetList(widget.userId);
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
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                1 * fem, 0 * fem, 0 * fem, 25 * fem),
                            child: Text(
                              widget.account ??= '', // 使用 widget 取得父 Widget 的屬性
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
                        ],
                      )),
                  // WordSet list
                  Expanded(
                      flex: 20,
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        color: Colors.transparent,
                        child: wordSetsWidget,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getAccount() async {
    // final userProvider = Provider.of<UserProvider>(context);
    final tokenSP = await SharedPreferences.getInstance();
    String? account = tokenSP.getString('username');
    String? userId = tokenSP.getString('userId');
    if (account != null && userId != null) {
      return {'account': account, 'userId': userId};
    }
    throw Future.error('請先登入');
  }

  Future<void> _showAddWordSetDialog(BuildContext context) async {
    String name = ''; // Variable to store the new set name

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('增加新群組'),
          content: TextField(
            onChanged: (value) {
              name = value;
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
                wordSetService
                    .save(WordSet(name: name, createId: widget.userId));
                // setState(() {
                //   wordSetsWidget = userView.getWordSetList(widget.userId);
                // });
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
