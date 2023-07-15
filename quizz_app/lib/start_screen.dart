import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),
          const SizedBox(height: 80),
          const Text(
            'Second App: Quizz App',
            style: TextStyle(
              color: Color.fromARGB(255, 54, 15, 0),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          const Icon(Icons.query_builder),
          OutlinedButton.icon(
            onPressed: () {},
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
