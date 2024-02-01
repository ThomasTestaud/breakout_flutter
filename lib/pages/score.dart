import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.title, required this.score});

  final String title;
  final int score;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Fin de la partie !", style: TextStyle(fontSize: 25)),
            Text("Vous avez obtenu ${widget.score} points !",
                style: const TextStyle(fontSize: 30)),
            Text(widget.score > 4 ? "Vous êtes un expert !" : widget.score > 3 ? 'Vous avez obtenu la mention "Ça va"' : 'Vous êtes nul...', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(150), // Image radius
              child: Image.network(widget.score > 4 ? 'img/great.gif' : widget.score > 3 ? 'img/good.gif' : 'img/bad.gif', fit: BoxFit.cover),
            ),
          ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Rejouer"))
          ],
        ),
      ),
    );
  }
}
