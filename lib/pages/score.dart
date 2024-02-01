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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Fin de la partie !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 199, 91, 28))),
              Text(
                "Vous avez obtenu ${widget.score} points !",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                  widget.score > 4
                      ? "Vous êtes un expert !"
                      : widget.score > 3
                          ? 'Vous avez obtenu la mention "Ça va"'
                          : 'Vous êtes nul...',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(150), // Image radius
                  child: Image.asset(
                      widget.score > 4
                          ? 'img/great.gif'
                          : widget.score > 3
                              ? 'img/good.gif'
                              : 'img/bad.gif',
                      fit: BoxFit.cover),
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
      ),
    );
  }
}
