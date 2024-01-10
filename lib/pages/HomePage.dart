import 'package:flutter/material.dart';
 // Adjust the import path

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> words = ["Word1", "Word2", "Word3", "Word4"];
  int currentWordIndex = 0;
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GOENG',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildWordCard(),
            SizedBox(height: 20),
            buildActionButtons(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildWordCard() {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              words[currentWordIndex],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            buildExplanations(),
          ],
        ),
      ),
    );
  }

  Widget buildExplanations() {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            // Logic for explanation 1
          },
          decoration: InputDecoration(labelText: 'Explanation 1'),
        ),
        SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            // Logic for explanation 2
          },
          decoration: InputDecoration(labelText: 'Explanation 2'),
        ),
      ],
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: _dislikeWord,
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: const Text('不喜歡'),
        ),
        ElevatedButton(
          onPressed: () {
            _showLikeOptionsDialog(context);
          },
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: const Text('喜歡'),
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '首頁',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '賬號',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          // Navigate to the home page or perform other actions
        } else if (index == 1) {
          // Navigate to the user page
         
        }
      },
    );
  }

  void _dislikeWord() {
    // Logic for "不喜歡" button
    // Move to the next word for now
    _nextWord();
  }

  void _showLikeOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('選擇喜歡的原因'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildLikeOption('有趣'),
              buildLikeOption('有用'),
              buildLikeOption('其他'),
            ],
          ),
        );
      },
    );
  }

  Widget buildLikeOption(String option) {
    return ListTile(
      title: Text(option),
      onTap: () {
        _likeWord(option);
        Navigator.of(context).pop();
      },
    );
  }

  void _likeWord(String reason) {
    setState(() {
      favorites.add('${words[currentWordIndex]} - $reason');
    });
    _nextWord();
  }

  void _nextWord() {
    setState(() {
      currentWordIndex = (currentWordIndex + 1) % words.length;
    });
  }
}
