import 'package:flutter/material.dart';

// Main function to run the Flutter app
void main() {
  runApp(const MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0), // Adds padding around the animation widget
        child: SquareAnimation(),
      ),
    );
  }
}

// Stateful widget that handles the animated movement of the square
class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

// State class for SquareAnimation, managing its animation logic
class SquareAnimationState extends State<SquareAnimation>
    with SingleTickerProviderStateMixin {
  static const _squareSize = 50.0; // Constant size for the animated square

  int tapped = 0; // Represents the current position state
  bool isMoving = false; // Flag to disable buttons if its animating

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
            // Callback when the animation ends
            onEnd: () {
              isMoving = false; // Allow new animations
              setState(() {});
            },
            curve: Curves.fastOutSlowIn, // Smooth animation curve
            duration: const Duration(seconds: 1), // Animation duration
            alignment: tapped == 0
                ? Alignment.center
                : tapped == 1
                    ? Alignment.centerLeft // Move square to the left
                    : Alignment.centerRight, // Move square to the right
            child: Container(
              width: _squareSize,
              height: _squareSize,
              decoration: BoxDecoration(
                color: Colors.red, // Square color
                border: Border.all(), // Adds border to the square
              ),
            )),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                if (isMoving == false) {
                  if (tapped != 2) {
                    isMoving = true; // Start moving
                    tapped = 2; // Set position to right
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
                  if (tapped != 1) {
                    isMoving = true; // Start moving
                    tapped = 1; // Set position to left
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
