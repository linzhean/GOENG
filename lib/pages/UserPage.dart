import 'package:flutter/material.dart';
import 'package:goeng/pages/WordPage.dart';
import 'package:goeng/services/WordService.dart';
import 'package:goeng/views/HomeView.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1.0;
    double ffem = 1.0;

    // Replace this with your actual data source or logic
    List<String> words = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Fig',
      'Grapes',
    ];

    String username = '王小明'; // Replace with dynamic username

    return Container(
      color: const Color(0xfc000000), // Set the background color
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(17 * fem, 20 * fem, 17 * fem, 48 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 18 * fem),
                    child: Text(
                      'GOENG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 25 * fem),
                    child: Text(
                      username, // Use the dynamic username here
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 28 * fem),
                    padding: EdgeInsets.fromLTRB(20 * fem, 10 * fem, 20 * fem, 10 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16 * fem,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24 * fem,
                        ),
                      ],
                    ),
                  ),

                  // Dynamically generate word cards
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,  // Adjust the height as needed
                    child: ListView.builder(
                      itemCount: words.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(words[index]),
                            // Add more ListTile customization as needed
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
