import 'package:flutter/material.dart';
import 'package:quizz_app/data/question.dart';
import 'package:quizz_app/pages/score.dart';
import 'package:quizz_app/pages/quizzWidgets/questionCard.dart';
import 'package:quizz_app/pages/quizzWidgets/explanationCard.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class Brick {
  double x;
  double y;

  Brick(this.x, this.y);
}

class MyQuizzPage extends StatefulWidget {
  const MyQuizzPage({super.key, required this.title});

  final String title;

  @override
  State<MyQuizzPage> createState() => _MyQuizzPageState();
}

class _MyQuizzPageState extends State<MyQuizzPage> {
  // BRICK GAME VARIABLES //
  double x = 100;
  double y = 250;
  double dx = 2;
  double dy = 2;

  double sliderValue = 50;
  double right = 20;
  double left = 20;

  newBall() {
    x = 100;
    y = 250;
    dx = 2;
    dy = 2;
  }

  List<Brick> bricks = [
    new Brick(100, 100),
    //new Brick(160, 100),
    new Brick(220, 100),
    new Brick(280, 100),
    //new Brick(100, 140),
    //new Brick(160, 140),
    new Brick(220, 140),
    //new Brick(280, 140),
    new Brick(100, 180),
    new Brick(160, 180),
  ];

  // QUIZZ VARIABLES ///
  bool brickGame = true;
  var questions = QuestionData();

  int score = 0;
  int currentQuestion = 0;
  bool displayExplanation = false;
  bool rightAnswer = false;

  @override
  Widget build(BuildContext context) {
    void pushToScorePage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              ResultPage(title: "Résultat", score: score),
        ),
      );
    }

    void nextQuestion() {
      if (currentQuestion == questions.questionList.length - 1) {
        pushToScorePage();
      } else {
        setState(() {
          brickGame = true;
          newBall();
          displayExplanation = false;
          currentQuestion++;
        });
      }
    }

    void checkAnswer(bool userAnswer) {
      setState(() {
        displayExplanation = true;
        if (userAnswer == questions.questionList[currentQuestion].response) {
          score++;
          rightAnswer = true;
        } else {
          rightAnswer = false;
        }
      });
    }

    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    void loopFunction() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (brickGame == false) {
          return;
        }
        if (x >= screenWidth - 20 || x <= 0) {
          dx = -dx;
        }
        if (((y >= screenHeight - 20 - 150 &&
                y <= screenHeight - 20 - 150 + 20) &&
            (x > sliderValue && x < sliderValue + 100))) {
          y = screenHeight - 20 - 150;
          dy = -dy;
          dx = (x - sliderValue - 50) / 20;
        }
        if (y <= 0) {
          dy = -dy;
        }
        x += dx;
        y += dy;

        if (right < 20) {
          sliderValue += 3;
          right++;
        }
        if (left < 20) {
          sliderValue -= 3;
          left++;
        }

        for (Brick brick in bricks) {
          if (((y >= brick.y - 20 && y <= brick.y + 10 + 20) &&
              (x > brick.x - 20 && x < brick.x + 50))) {
            if ((y >= brick.y - 15 && y <= brick.y + 10 + 15)) {
              dx = -dx;
            } else {
              dy = -dy;
            }

            bricks.remove(brick);
            brickGame = false;
            break;
          }
        }

        setState(() {});
      });
    }

    loopFunction();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawerEdgeDragWidth: screenWidth,
      ///////////////////////////////////////////START OF BRICKGAME HERE
      body: !brickGame
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  !displayExplanation
                      ? QuestionCard(
                          index: currentQuestion + 1,
                          question:
                              questions.questionList[currentQuestion].question,
                          response:
                              questions.questionList[currentQuestion].response,
                          checkAnswer: checkAnswer,
                          img: questions.questionList[currentQuestion].imagePath
                          )
                      : const SimpleDialog(),
                  displayExplanation
                      ? explanationCard(
                          rightAnswer,
                          questions.questionList[currentQuestion].explanation,
                          nextQuestion)
                      : const SimpleDialog(),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              child: Stack(
                children: [
                  for (Brick brick in bricks)
                    Positioned(
                      left: brick.x,
                      top: brick.y,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 145, 33),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  Positioned(
                    left: x,
                    top: y,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: sliderValue,
                    top: screenHeight - 150,
                    child: Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 0, 0),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          left = 0;
                        });
                      },
                      child: Text('<<'),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          right = 0;
                        });
                      },
                      child: Text('>>'),
                    ),
                  ),
                  y > screenHeight ? Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          newBall();
                        });
                      },
                      child: Text('Nouvelle balle'),
                    ),
                  ) : Container(),
                ],
              ),
            ),
    );
  }
}
