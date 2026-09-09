import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_expense_app/core/presentation/widgets/async_error_view.dart';
import 'package:travel_expense_app/features/expenses/presentation/providers/expense_providers.dart';

class ExpenseDetailScreen extends ConsumerWidget {
  final String expenseId;

  const ExpenseDetailScreen({required this.expenseId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expense = ref.watch(expenseDetailProvider(expenseId));

    return Scaffold(
      appBar: AppBar(title: const Text('Expense details')),
      body: expense.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => AsyncErrorView(
          error: error,
          onRetry: () => ref.invalidate(expenseDetailProvider(expenseId)),
        ),
        data: (item) => ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _DetailRow(label: 'Category', value: item.category.name),
            _DetailRow(
              label: 'Amount',
              value: NumberFormat('#,##0.00').format(item.amount),
            ),
            _DetailRow(
              label: 'Date',
              value: DateFormat.yMMMMd().format(item.date),
            ),
            _DetailRow(
              label: 'Note',
              value: item.note.isEmpty ? '—' : item.note,
            ),
            _DetailRow(label: 'Reference', value: item.id),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
