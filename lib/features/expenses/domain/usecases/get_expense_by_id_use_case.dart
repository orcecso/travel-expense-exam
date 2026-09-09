import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';

class GetExpenseByIdUseCase {
  final ExpenseRepository repository;

  const GetExpenseByIdUseCase(this.repository);

  Future<Either<Failure, Expense>> call(String id) {
    return repository.getExpenseById(id);
  }
}
