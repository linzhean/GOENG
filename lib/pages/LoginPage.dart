import 'package:flutter/material.dart';
import 'package:goeng/pages/ForgotpasswordPage.dart';
import 'package:goeng/pages/SingupPage.dart';
import 'package:goeng/pages/WordListPage.dart';
import 'package:goeng/services/UserService.dart';
import 'package:goeng/views/ColorTheme.dart';
import 'package:goeng/pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 登入介面
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userService = UserService();

  /// 帳號編輯控制器
  final TextEditingController controllerAccount = TextEditingController();

  /// 密碼編輯控制器
  final TextEditingController controllerPassword = TextEditingController();

  /// 是否隱藏密碼
  bool isShowPassword = false;

  /// 錯誤訊息
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // 檢查當前的路由是否是 LoginPage
          if (ModalRoute.of(context)?.settings.name == '/login') {
            // 在此處放置 LoginPage 返回按鈕的操作
            // 返回 true 表示允許退出應用程式，返回 false 表示禁止退出應用程式
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('確認離開'),
                content: const Text('確定要離開登入頁面嗎？'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('取消'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('確定'),
                  ),
                ],
              ),
            );
            return false;
          } else {
            // 允許正常返回
            return true;
          }
        },
        child: Scaffold(
          body: getBody(),
          resizeToAvoidBottomInset: false,
        ));
  }

  /// 構建頁面內容
  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Welcome to GOENG",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              width: 90,
              height: 5,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              cursorColor: Colors.black,
              controller: controllerAccount,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "請輸入帳號(電話號碼/電子郵箱)",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: !isShowPassword,
              cursorColor: Colors.black,
              controller: controllerPassword,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 14),
                hintText: "請輸入密碼",
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(
                    isShowPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                gotoForgotPassword();
              },
              child: const Align(
                child: Text("忘記密碼"),
                alignment: Alignment.centerRight,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 在此處放置按下按鈕時的操作
                      validateCredentials();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // 設定按鈕的填充色為黑色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // 設定圓角半徑
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '登入',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                goToSignUpPage();
              },
              child: const Align(
                child: Text("未註冊"),
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  /// 跳轉首頁
  goToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WordListPage()),
    );
  }

  /// 跳轉註冊介面
  goToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  /// 修改密碼介面
  gotoForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
    );
  }

  /// 驗證帳戶和密碼
  void validateCredentials() {
    final String account = controllerAccount.text.trim();
    final String password = controllerPassword.text.trim();

    if (account.isEmpty) {
      setState(() {
        errorMessage = '請輸入帳號';
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        errorMessage = '請輸入密碼';
      });
      return;
    }

    // 執行登入操作
    authenticateUser(account, password);
  }

  /// 模擬用戶驗證
  void authenticateUser(String account, String password) async {
    final token = await userService.loginUser(account, password);
    final tokenSP = await SharedPreferences.getInstance();
    final setTokenResult = await tokenSP.setString('token', token);
    if (setTokenResult) {
      print('登入成功');
      goToHomePage();
    } else {
      setState(() {
        errorMessage = '帳號或密碼錯誤';
      });
      print('登入失敗');
    }
  }
}
