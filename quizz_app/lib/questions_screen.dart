import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'The Question...',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          AnswerButton(answerText: 'Answer', onTap: () {}),
          AnswerButton(answerText: 'Answer', onTap: () {}),
          AnswerButton(answerText: 'Answer', onTap: () {}),
        ],
      ),
    );
  }
}
