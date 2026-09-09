import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;

  const ExpenseCard({
    required this.expense,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final amount = NumberFormat('#,##0.00').format(expense.amount);
    final date = DateFormat.yMMMd().format(expense.date);

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(child: Text(expense.category.label.substring(0, 1))),
        title: Text(expense.category.label),
        subtitle: Text('$date · ${expense.note.isEmpty ? 'No note' : expense.note}'),
        trailing: Text(
          amount,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
