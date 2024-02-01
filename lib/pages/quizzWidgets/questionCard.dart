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
    return AlertDialog(
      title: Text("Question ${index.toString()}"),
      content: Column( children: [
        Image(image: AssetImage('img/$img')),
        Text(question),
      ]),
      actions: [
        TextButton(
          onPressed: () {
            checkAnswer(false);
          },
          child: const Text("Faux"),
        ),
        TextButton(
          onPressed: () {
            checkAnswer(true);
          },
          child: const Text("Vrais"),
        ),
      ],
    );
  }
}
