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

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  String? userName;
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
    final wordsWidget = userView.getWordList(widget.userId ??= '');
    return Material(
      color: const Color(0xfc000000),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(17, 20, 17, 48),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(1, 0, 0, 20),
                child: Text(
                  widget.userName ??= '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: wordsWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getAccount() async {
    final tokenSP = await SharedPreferences.getInstance();
    String? userName = tokenSP.getString('userName');
    String? userId = tokenSP.getString('userId');
    if (userName != null && userId != null) {
      return {'userName': userName, 'userId': userId};
    }
    throw Future.error('請先登入');
  }
}
