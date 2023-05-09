import 'package:flutter/material.dart';
import 'package:qize/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(height: 30),
      Image.asset(
        'images/logo.png',
        height: 150,
        width: 150,
      ),
      SizedBox(height: 10),
      Text(
        'Select a language:',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 80),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "css")),
                );
              },
              child: Image.asset(
                'images/css.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "HTML")),
                );
              },
              child: Image.asset(
                'images/html.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "js")),
                );
              },
              child: Image.asset(
                'images/js.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "C#")),
                );
              },
              child: Image.asset(
                'images/c#.png',
                height: 150,
                width: 150,
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "java")),
                );
              },
              child: Image.asset(
                'images/java.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "swift")),
                );
              },
              child: Image.asset(
                'images/swift.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "React")),
                );
              },
              child: Image.asset(
                'images/react.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(language: "flutter")),
                );
              },
              child: Image.asset(
                'images/flutter.png',
                height: 150,
                width: 150,
              ),
            )
          ],
        ),
      ),
    ]));
  }
}
