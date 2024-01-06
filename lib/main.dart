import 'package:flutter/material.dart';
import 'package:goeng/pages/HomePage.dart';
import 'package:goeng/pages/UserPage.dart';

void main() => runApp(
      const MaterialApp(
        home: UserPage(username: '王小明'),
      ),
    );
