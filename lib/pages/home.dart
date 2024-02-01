import 'package:flutter/material.dart';
import 'package:quizz_app/pages/quizz.dart';
import 'package:quizz_app/pages/score.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Le Casse-Brique"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("6 questions",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const Text("pour tester vos connaissances sur le casse-brique",
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          /*Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Image.asset('img/breakout.gif'),
          ),*/
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(150), // Image radius
              child: Image.network('img/breakout.gif', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MyQuizzPage(title: "Quizz")
                        //const ResultPage(title: "Score", score: 4)
                        ));
              },
              child: const Text("Commencer le Quizz"))
        ]),
      ),
    );
  }
}
