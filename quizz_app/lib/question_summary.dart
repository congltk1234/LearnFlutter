import 'package:flutter/material.dart';
import 'package:quizz_app/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(120, 255, 236, 91),
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map(
              (data) {
                return SummaryItem(data);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
