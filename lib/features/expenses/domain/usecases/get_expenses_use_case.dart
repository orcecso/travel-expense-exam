import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';

class GetExpensesUseCase {
  final ExpenseRepository repository;

  const GetExpensesUseCase(this.repository);

  Future<Either<Failure, List<Expense>>> call() async {
    final result = await repository.getExpenses();
    return result.map((items) {
      final sorted = [...items]..sort((a, b) => b.date.compareTo(a.date));
      return sorted;
    });
  }
}
