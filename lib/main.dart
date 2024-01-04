import 'package:flutter/material.dart';
import 'package:goeng/pages/ForgotpasswordPage.dart';
import 'package:goeng/pages/HomePage.dart';
import 'package:goeng/pages/SingupPage.dart';
import 'package:goeng/views/ColorTheme.dart';

void main() => runApp(
      const MaterialApp(
        home: HomePage(),
      ),
    );

/// 登入介面
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  /// 帳號編輯控制器
  final TextEditingController _controllerEmail = TextEditingController();

  /// 密碼編輯控制器
  final TextEditingController _controllerPassword = TextEditingController();

  /// 是否隱藏密碼
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      resizeToAvoidBottomInset: false,
    );
  }

  ///
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
            "Welcome to GoEng",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Container(
            width: 90,
            height: 5,
            decoration: const BoxDecoration(color: primary),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            cursorColor: primary,
            controller: _controllerEmail,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primary)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primary)),
                hintText: "請輸入帳號(電話號碼/電子郵箱)",
                hintStyle: TextStyle(fontSize: 14)),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            obscureText: !isShowPassword,
            cursorColor: primary,
            controller: _controllerPassword,
            decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 14),
                hintText: "請輸入密碼",
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: primary)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: primary)),
                suffixIcon: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Icon(
                      isShowPassword ? Icons.visibility : Icons.visibility_off,
                      color: primary,
                    ))),
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
              )),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FloatingActionButton(
                    focusColor: primary,
                    onPressed: () {
                      print("login action");
                    },
                    child: const Text(
                      "登入",
                      style: TextStyle(color: white),
                    )),
              )
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
              ))
        ],
      ),
    ));
  }

  /// 跳转注册界面
  goToSignUpPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  /// 修改密码界面
  gotoForgotPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
  }
}
