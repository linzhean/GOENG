import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:goeng/model/ExpansionPanelItem.dart';
import 'package:goeng/views/WordView.dart';

class WordPage extends StatelessWidget {
  final String word;

  const WordPage({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wordView = WordView(word);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'GOENG',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.backspace_rounded),
            color: const Color(0xff1d1d1d),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 7,
                          spreadRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: wordView.wordArea(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ExpandList(
                    wordView: wordView,
                  ),
                ],
              )),
        ));
  }
}

class ExpandList extends StatefulWidget {
  final WordView wordView;

  const ExpandList({Key? key, required this.wordView}) : super(key: key);
  @override
  State<ExpandList> createState() => _ExpandListState(wordView);
}

class _ExpandListState extends State<ExpandList> {
  final WordView wordView;
  late ExpansionPanelItem item;

  _ExpandListState(this.wordView) {
    item = ExpansionPanelItem('example');
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: const EdgeInsets.all(10),
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          item.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
                title: Text(
              item.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ));
          },
          body: wordView.exampleArea(),
          isExpanded: item.isExpanded,
        )
      ],
    );
  }
}
