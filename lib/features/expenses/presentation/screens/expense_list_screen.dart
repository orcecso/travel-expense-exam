import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_expense_app/core/presentation/widgets/async_error_view.dart';
import 'package:travel_expense_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:travel_expense_app/features/expenses/presentation/providers/expense_providers.dart';
import 'package:travel_expense_app/features/expenses/presentation/widgets/expense_card.dart';

class ExpenseListScreen extends ConsumerWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(expenseListControllerProvider);
          await ref.read(expenseListControllerProvider.future);
        },
        child: expenses.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => AsyncErrorView(
            error: error,
            onRetry: () =>
                ref.read(expenseListControllerProvider.notifier).reload(),
          ),
          data: (items) {
            if (items.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 180),
                  Icon(Icons.receipt_long_outlined, size: 56),
                  SizedBox(height: 12),
                  Center(child: Text('No expenses yet.')),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              separatorBuilder: (_, i) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final expense = items[index];
                return ExpenseCard(
                  expense: expense,
                  onTap: () => context.go('/expenses/${expense.id}'),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/add-expense'),
        icon: const Icon(Icons.add),
        label: const Text('Add expense'),
      ),
    );
  }
}
