import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
            Color.fromARGB(255, 255, 0, 85),
            Color.fromARGB(255, 204, 102, 47)
          ])),
      // child: Column(children: [
      //   Text("Memes:",style: TextStyle(""),)
      // ]),
    ));
  }
}
