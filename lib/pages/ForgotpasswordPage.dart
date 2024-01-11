import 'package:flutter/material.dart';
import 'package:goeng/theme/ColorTheme.dart';

///  忘記密碼介面
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  ///
  Widget getBody() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Icon(Icons.arrow_back_ios),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text("忘記密碼",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(
                height: 38,
              ),
              TextField(
                cursorColor: primary,
                controller: _controllerEmail,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                    hintText: "請輸入你的電話號碼/電子郵箱",
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FloatingActionButton(
                        focusColor: primary,
                        onPressed: () {
                          forgotPassword();
                        },
                        child: const Text(
                          "完成",
                          style: TextStyle(color: white),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }

  forgotPassword() {
    String emailField = _controllerEmail.text;
    if (emailField.isNotEmpty) {
      // process api here
      alertSample(emailField);
    }
  }

  /// 獲取驗證碼
  Future<void> alertSample(email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("獲取驗證碼"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("發送驗證碼至 $email 手機"),
              ],
            ),
          ),
          actions: <Widget>[
            FloatingActionButton(
              child: const Text("確認"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
