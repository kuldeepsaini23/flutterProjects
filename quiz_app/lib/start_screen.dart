import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ! Method 1 to make image transparent but this method is perfoemance intensive
          // Opacity(
          //   opacity: 0.4,
          //   //* Image
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          // !Method to add tranparent color
          //* Image
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          //*Gap between two widgets
          const SizedBox(height: 80),
          //* Text
          const Text(
            "Learn Fluter the fun way",
            style: TextStyle(
              color: Color.fromARGB(255, 244, 212, 242),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          //*Button to start the quiz and to add icon we must use OutlineButton.icon constructor function
          OutlinedButton.icon(
              // onPressed: () {
              //   startQuiz();
              // },
               onPressed:startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
