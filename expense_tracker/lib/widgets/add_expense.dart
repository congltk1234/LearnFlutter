import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              maxLength: 40,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),
          ],
        ),
      );
}
