import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation>
    with SingleTickerProviderStateMixin {
  static const _squareSize = 50.0;

  int tapped = 0;
  bool isMoving = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
            onEnd: () {
              isMoving = false;
              setState(() {});
            },
            curve: Curves.fastOutSlowIn,
            alignment: tapped == 0
                ? Alignment.center
                : tapped == 1
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(seconds: 1),
            child: Container(
              width: _squareSize,
              height: _squareSize,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(),
              ),
            )),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                if (isMoving == false) {
                  if (tapped != 1) {
                    isMoving = true;
                    tapped = 1;
                  }
                  setState(() {});
                }
              },
              child: const Text('Right'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                if (isMoving == false) {
                  if (tapped != 2) {
                    isMoving = true;
                    tapped = 2;
                  }
                  setState(() {});
                }
              },
              child: const Text('Left'),
            ),
          ],
        ),
      ],
    );
  }
}
