import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';

class AddExpenseUseCase {
  final ExpenseRepository repository;

  const AddExpenseUseCase(this.repository);

  Future<Either<Failure, Expense>> call(AddExpenseParams params) {
    if (params.amount <= 0) {
      return Future.value(
        const Left(ValidationFailure('Amount must be greater than zero.')),
      );
    }
    if (params.note.trim().length > 500) {
      return Future.value(
        const Left(ValidationFailure('Note must be 500 characters or fewer.')),
      );
    }
    return repository.addExpense(params);
  }
}
