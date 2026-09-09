import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/add_expense_use_case.dart';

class MockExpenseRepository extends Mock implements ExpenseRepository {}

void main() {
  late MockExpenseRepository repository;
  late AddExpenseUseCase useCase;

  setUpAll(() {
    registerFallbackValue(
      AddExpenseParams(
        amount: 1,
        date: DateTime(2026, 1, 1),
        category: ExpenseCategory.other,
        note: '',
      ),
    );
  });

  setUp(() {
    repository = MockExpenseRepository();
    useCase = AddExpenseUseCase(repository);
  });

  test('rejects zero or negative amounts without calling repository', () async {
    final params = AddExpenseParams(
      amount: 0,
      date: DateTime(2026, 9, 1),
      category: ExpenseCategory.taxi,
      note: 'Airport transfer',
    );

    final result = await useCase(params);

    expect(
      result,
      const Left(ValidationFailure('Amount must be greater than zero.')),
    );
    verifyNever(() => repository.addExpense(any()));
  });

  test('delegates valid expense to repository', () async {
    final params = AddExpenseParams(
      amount: 48.25,
      date: DateTime(2026, 9, 1),
      category: ExpenseCategory.restaurant,
      note: 'Dinner',
    );
    final expense = Expense(
      id: '21',
      amount: params.amount,
      date: params.date,
      category: params.category,
      note: params.note,
    );

    when(() => repository.addExpense(params)).thenAnswer(
      (_) async => Right(expense),
    );

    final result = await useCase(params);

    expect(result, Right(expense));
    verify(() => repository.addExpense(params)).called(1);
  });
}
