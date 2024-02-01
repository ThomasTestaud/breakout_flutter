import 'package:flutter/material.dart';

SimpleDialog explanationCard(bool rightAnswer, explanation, nextQuestion) {
  return SimpleDialog(
    title: rightAnswer ? Text("Bien joué !") : Text("Raté !"),
    elevation: 12,
    children: [
      Text(explanation),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              nextQuestion();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    ],
  );
}
