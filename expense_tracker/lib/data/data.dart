import 'package:expense_tracker/model/expense.dart';

final List<Expense> registeredExpenses = [
  Expense(
    title: 'Learn Course',
    amount: 20,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: 'Handon Course',
    amount: 40,
    date: DateTime.now(),
    category: Category.work,
  ),
];
