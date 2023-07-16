import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpensesOVerlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const Text('Modal bottem sheet'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOVerlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: registeredExpenses)),
          // Text(_registeredExpenses[0].date as String),
        ],
      ),
    );
  }
}
