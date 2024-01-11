import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:goeng/pages/HomePage.dart';
import 'package:goeng/pages/LoginPage.dart';
import 'package:goeng/pages/WordListPage.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:goeng/utils.dart';
// import 'package:goeng/pages/singleWord_LR.dart';

// class MyApp extends StatelessWidget {
// 	@override
// 	Widget build(BuildContext context) {
// 	return MaterialApp(
// 		title: 'Flutter',
// 		debugShowCheckedModeBanner: false,
// 		scrollBehavior: MyCustomScrollBehavior(),
// 		theme: ThemeData(
// 		primarySwatch: Colors.blue,
// 		),
// 		home: Scaffold(
// 		body: SingleChildScrollView(
// 			child: HomePage(),
// 		),
// 		),
// 	);
// 	}
// }

void main() => runApp(MaterialApp(
      home: LoginPage(),
    ));
