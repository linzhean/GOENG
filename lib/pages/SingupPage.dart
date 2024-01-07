import 'package:flutter/material.dart';
import 'package:goeng/views/ColorTheme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerFullname = TextEditingController();
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
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 131, 66, 206),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Color.fromARGB(255, 131, 66, 206),
                controller: _controllerEmail,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 131, 66, 206)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 131, 66, 206)),
                  ),
                  hintText: "請輸入你的電話號碼/電子信箱",
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: !isShowPassword,
                cursorColor: Color.fromARGB(255, 131, 66, 206),
                controller: _controllerPassword,
                decoration: InputDecoration(
                  hintText: "請輸入密碼",
                  hintStyle: const TextStyle(fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 131, 66, 206)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 131, 66, 206)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    icon: Icon(
                      isShowPassword ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromARGB(255, 131, 66, 206),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Color.fromARGB(255, 131, 66, 206),
                controller: _controllerFullname,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 131, 66, 206)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 131, 66, 206)),
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
                  primary: Color.fromARGB(255, 131, 66, 206),
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
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    String fullName = _controllerFullname.text;

    print("註冊成功！Email: $email | 密碼: $password | 姓名: $fullName");
  }
}
