import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
// * init Sate Methid
  // Widget ? activeScreen;

  // @override
  // void initState() {
  // TODO: implement initState
  //   activeScreen =  StartScreen(switchScreen);
  //   super.initState();
  // }

  //* Ternanery method
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // print(selectedAnswers.length);
    // adding validation
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      //* Restarting the quiz
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // * this is also one of the way to do it
    // final screenWidget = activeScreen == 'start-screen'
    //           ? StartScreen(switchScreen)
    //           : const QuestionsScreen();

    //* last and final method

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // *Method 1
          // child: activeScreen,
          // *Method 2
          child: screenWidget,
        ),
      ),
    );
  }
}
