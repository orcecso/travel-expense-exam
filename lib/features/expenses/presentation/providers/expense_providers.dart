import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_expense_app/core/dependency_injection/injection.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/add_expense_use_case.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/get_expense_by_id_use_case.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/get_expenses_use_case.dart';

part 'expense_providers.g.dart';

@riverpod
GetExpensesUseCase getExpensesUseCase(Ref ref) => getIt<GetExpensesUseCase>();

@riverpod
GetExpenseByIdUseCase getExpenseByIdUseCase(Ref ref) =>
    getIt<GetExpenseByIdUseCase>();

@riverpod
AddExpenseUseCase addExpenseUseCase(Ref ref) => getIt<AddExpenseUseCase>();

@riverpod
class ExpenseListController extends _$ExpenseListController {
  @override
  Future<List<Expense>> build() async {
    final result = await ref.watch(getExpensesUseCaseProvider).call();
    return result.fold((failure) => throw failure, (items) => items);
  }

  void reload() {
    ref.invalidateSelf();
  }
}

@riverpod
Future<Expense> expenseDetail(Ref ref, String id) async {
  final result = await ref.watch(getExpenseByIdUseCaseProvider).call(id);
  return result.fold((failure) => throw failure, (expense) => expense);
}

@riverpod
class AddExpenseController extends _$AddExpenseController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit(AddExpenseParams params) async {
    state = const AsyncLoading();
    final result = await ref.read(addExpenseUseCaseProvider).call(params);

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(expenseListControllerProvider);
        return true;
      },
    );
  }
}
