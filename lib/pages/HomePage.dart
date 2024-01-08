import 'package:flutter/material.dart';
import 'package:goeng/pages/WordPage.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/views/HomeView.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeView homeView = HomeView('王小明');
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'GOENG',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  child: TextField(
                    onSubmitted: (value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WordPage(word: value)));
                    },
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: '搜尋',
                      hintStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                  ),
                )),
            Expanded(
                flex: 20,
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  color: Colors.transparent,
                  child: homeView.wordListArea(),
                ))
          ],
        ));
  }
}