import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(170, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Second App: Quizz App',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 54, 15, 0),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          const Icon(Icons.query_builder),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 54, 15, 0),
              backgroundColor: Colors.white,
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
