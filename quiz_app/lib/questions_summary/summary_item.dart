import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData["question_index"] as int,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Question text
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //*User Answer
                Text(
                  itemData['user_answer'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 224, 208, 251),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //*Correct Answer
                Text(
                  itemData['correct_answer'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 19, 206, 110),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
