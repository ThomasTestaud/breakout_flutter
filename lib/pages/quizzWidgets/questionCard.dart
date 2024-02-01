import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final int index;
  final String question;
  final bool response;
  final Function(bool) checkAnswer;
  final String img;

  QuestionCard({
    required this.index,
    required this.question,
    required this.response,
    required this.checkAnswer,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Question ${index.toString()}",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      const SizedBox(height: 20),
      ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(150), // Image radius
              child: Image.asset('img/$img', fit: BoxFit.cover),
            ),
          ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Text(question,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center),
      ),
      const SizedBox(height: 40),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              checkAnswer(false);
            },
            child: const Text("Faux"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              checkAnswer(true);
            },
            child: const Text("Vrais"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      )
    ]);
  }
}
