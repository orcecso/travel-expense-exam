import 'package:equatable/equatable.dart';

enum ExpenseCategory { flight, hotel, restaurant, taxi, other }

extension ExpenseCategoryX on ExpenseCategory {
  String get apiValue => name;

  String get label => switch (this) {
        ExpenseCategory.flight => 'Flight',
        ExpenseCategory.hotel => 'Hotel',
        ExpenseCategory.restaurant => 'Restaurant',
        ExpenseCategory.taxi => 'Taxi',
        ExpenseCategory.other => 'Other',
      };

  static ExpenseCategory fromApiValue(String value) {
    return ExpenseCategory.values.firstWhere(
      (category) => category.name == value.toLowerCase(),
      orElse: () => ExpenseCategory.other,
    );
  }
}

class Expense extends Equatable {
  final String id;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final String note;

  const Expense({
    required this.id,
    required this.amount,
    required this.date,
    required this.category,
    required this.note,
  });

  @override
  List<Object?> get props => [id, amount, date, category, note];
}

class AddExpenseParams extends Equatable {
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final String note;

  const AddExpenseParams({
    required this.amount,
    required this.date,
    required this.category,
    required this.note,
  });

  @override
  List<Object?> get props => [amount, date, category, note];
}
