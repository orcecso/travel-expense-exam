import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_expense_app/core/error/api_exception.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/data/datasources/expense_remote_data_source.dart';
import 'package:travel_expense_app/features/expenses/data/models/expense_model.dart';
import 'package:travel_expense_app/features/expenses/data/repositories/expense_repository_impl.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';

class MockExpenseRemoteDataSource extends Mock
    implements ExpenseRemoteDataSource {}

void main() {
  late MockExpenseRemoteDataSource remoteDataSource;
  late ExpenseRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockExpenseRemoteDataSource();
    repository = ExpenseRepositoryImpl(remoteDataSource);
  });

  test('maps ExpenseModel list to domain Expense list', () async {
    final model = ExpenseModel(
      id: '10',
      amount: 120.50,
      date: DateTime(2026, 9, 1),
      category: 'hotel',
      note: 'Client visit',
    );

    when(() => remoteDataSource.getExpenses()).thenAnswer((_) async => [model]);

    final result = await repository.getExpenses();

    expect(result.isRight(), isTrue);
    final items = result.getOrElse(() => const []);
    expect(items, hasLength(1));
    expect(
      items.single,
      Expense(
        id: '10',
        amount: 120.50,
        date: DateTime(2026, 9, 1),
        category: ExpenseCategory.hotel,
        note: 'Client visit',
      ),
    );
  });

  test('maps API exceptions to ServerFailure', () async {
    when(() => remoteDataSource.getExpenses()).thenThrow(
      const ApiException('Service unavailable.', statusCode: 503),
    );

    final result = await repository.getExpenses();

    expect(result, const Left(ServerFailure('Service unavailable.')));
  });
}
