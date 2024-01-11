import 'package:flutter/material.dart';
import 'package:goeng/entity/User.dart';
import 'package:goeng/entity/Word.dart';
import 'package:goeng/pages/LoginPage.dart';
import 'package:goeng/services/UserService.dart';
import 'package:goeng/theme/ColorTheme.dart';
import 'package:goeng/pages/WordListPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userService = UserService();
  final TextEditingController controllerAccount = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "註冊",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                width: 45,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                controller: controllerAccount,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "請輸入你的電話號碼/電子信箱",
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: !isShowPassword,
                cursorColor: Colors.black,
                controller: controllerPassword,
                decoration: InputDecoration(
                  hintText: "請輸入密碼",
                  hintStyle: const TextStyle(fontSize: 14),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
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
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                controller: controllerName,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "用戶名稱",
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: const Text("完成"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() {
    String account = controllerAccount.text;
    String password = controllerPassword.text;
    String name = controllerName.text;
    User user = User(userId: account, userName: name, password: password);
    userService.save(user);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
