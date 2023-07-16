import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
// import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    // TODO: implement createState
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: registeredExpenses)),
          // Text(_registeredExpenses[0].date as String),
        ],
      ),
    );
  }
}
