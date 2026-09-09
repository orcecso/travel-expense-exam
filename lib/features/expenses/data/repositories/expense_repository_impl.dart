import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/api_exception.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/data/datasources/expense_remote_data_source.dart';
import 'package:travel_expense_app/features/expenses/data/models/expense_model.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource remoteDataSource;

  const ExpenseRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Expense>>> getExpenses() async {
    try {
      final models = await remoteDataSource.getExpenses();
      return Right(models.map((model) => model.toEntity()).toList());
    } on ApiException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, Expense>> getExpenseById(String id) async {
    try {
      final model = await remoteDataSource.getExpenseById(id);
      return Right(model.toEntity());
    } on ApiException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, Expense>> addExpense(AddExpenseParams params) async {
    try {
      final request = CreateExpenseRequestModel.fromDomain(params);
      final model = await remoteDataSource.addExpense(request);
      return Right(model.toEntity());
    } on ApiException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }
}
