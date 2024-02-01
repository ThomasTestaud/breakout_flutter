import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyDynamicWidget(),
    );
  }
}


class Brick {
  double x;
  double y;

  Brick(this.x, this.y);
}

class MyDynamicWidget extends StatefulWidget {
  @override
  MyDynamicWidgetState createState() => MyDynamicWidgetState();
}

class MyDynamicWidgetState extends State<MyDynamicWidget> {
  double x = 100;
  double y = 100;
  double dx = 2;
  double dy = 2;

  double sliderValue = 50;
  double right = 20;
  double left = 20;

    List<Brick> level1 = [
      new Brick(100, 200),
      new Brick(160, 200),
      new Brick(220, 200),
      new Brick(280, 200),
      new Brick(100, 240),
      new Brick(160, 240),
      new Brick(220, 240),
      new Brick(280, 240),
      new Brick(100, 280),
      new Brick(160, 280),
      new Brick(220, 280),
      new Brick(280, 280),
    ];

    List<Brick> bricks = [];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    
    bricks = level1;
    

    void loopFunction() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (x >= screenWidth - 20 || x <= 0) {
          dx = -dx;
        }
        if (((y >= screenHeight - 20 - 100 &&
                y <= screenHeight - 20 - 100 + 20) &&
            (x > sliderValue && x < sliderValue + 100))) {
          y = screenHeight - 20 - 100;
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
            break;
          }
        }

        setState(() {});
      });
    }

    loopFunction();

    return Material(
      // Wrap with a Material widget
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
            top: screenHeight - 100,
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
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    x = 100;
                    y = 100;
                    bricks = level1;
                  });
                },
                child: Text('Recommencer'),
              )
            ],
          )
        ],
      ),
    );
  }
}
