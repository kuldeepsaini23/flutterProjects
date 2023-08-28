import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

//*hardcoding/maually inserting data
// class _QuestionsScreen extends State<QuestionsScreen> {

//   final currentQuestion = questions[0];

//   @override
//   Widget build(context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//            Text(
//             currentQuestion.text,
//             style: const TextStyle(
//               color: Colors.amberAccent,
//               fontSize: 28,
//             ),
//           ),
//           const SizedBox(height: 30),
// *          Manually adding 4 Buttons
//           AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
//           AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
//           AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
//           AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
//         ],
//       ),
//     );
//   }
// }

//*Maping
class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    // * adding statefulwidget function onselectedanswer with widget method provided by State
    widget.onSelectAnswer(answer);

    setState(() {
      if (currentQuestionIndex < questions.length) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionNumber,
              style: GoogleFonts.tiltPrism(
                  color: Colors.amberAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), //To add gap between two Widgets
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(
                  color: Colors.amberAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), //To add gap between two Widgets
            //* ...currentQuestion.answers.map((item) { these are the normal answers not shuffled, in the next line shuffled answers are aded
            ...currentQuestion.getShuffleAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () {
                  answerQuestion(item);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
