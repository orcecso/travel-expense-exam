import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_expense_app/features/expenses/domain/entities/expense.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

/// Converts a timestamp in seconds to a DateTime object.
DateTime dateTimeFromTimestamp(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(
    timestamp * 1000,
  );
}

int dateTimeToTimestamp(DateTime date) {
  return date.millisecondsSinceEpoch ~/ 1000;
}

@freezed
abstract class ExpenseModel with _$ExpenseModel {
  const ExpenseModel._();

  const factory ExpenseModel({
    required String id,
    required double amount,

    @JsonKey(
      fromJson: dateTimeFromTimestamp,
      toJson: dateTimeToTimestamp,
    )
    required DateTime date,
    required String category,
    required String note,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Expense toEntity() => Expense(
        id: id,
        amount: amount,
        date: date,
        category: ExpenseCategoryX.fromApiValue(category),
        note: note,
      );
}

@freezed
abstract class CreateExpenseRequestModel with _$CreateExpenseRequestModel {
  const CreateExpenseRequestModel._();

  const factory CreateExpenseRequestModel({
    required double amount,
    required DateTime date,
    required String category,
    required String note,
  }) = _CreateExpenseRequestModel;

  factory CreateExpenseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseRequestModelFromJson(json);

  factory CreateExpenseRequestModel.fromDomain(AddExpenseParams params) =>
      CreateExpenseRequestModel(
        amount: params.amount,
        date: params.date,
        category: params.category.apiValue,
        note: params.note,
      );
}
