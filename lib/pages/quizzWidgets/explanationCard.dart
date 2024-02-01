import 'package:flutter/material.dart';

void showExplanationCard(BuildContext context, bool rightAnswer, explanation, nextQuestion) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        titleTextStyle: TextStyle(
          color: rightAnswer ? const Color.fromARGB(255, 1, 150, 6) : Colors.red,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        title: rightAnswer
            ? const Text("Bien joué !", textAlign: TextAlign.center)
            : const Text("Raté !", textAlign: TextAlign.center),
        elevation: 12,
        children: [
          Image.asset('img/${rightAnswer ? "oui.gif" : "non.gif"}'),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,),
            child: Text(explanation, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                nextQuestion();
              },
              child: const Text("Question suivante"),
            ),
          ),
        ],
      );
    },
  );
}
