import 'package:flutter/material.dart';
import 'package:quizz_app/pages/quizz.dart';

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
        title: Text("Le Casse-Brique"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("6 questions pour tester vos connaissances sur le casse-brique",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center),
          const SizedBox(height: 20), 
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MyQuizzPage(title: "Quizz")));
              },
              child: const Text("Commencer le Quizz"))
        ]),
      ),
    );
  }
}