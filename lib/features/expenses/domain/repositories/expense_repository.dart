import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';

abstract interface class ExpenseRepository {
  Future<Either<Failure, List<Expense>>> getExpenses();
  Future<Either<Failure, Expense>> getExpenseById(String id);
  Future<Either<Failure, Expense>> addExpense(AddExpenseParams params);
}
