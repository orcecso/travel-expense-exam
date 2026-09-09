// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) =>
    _ExpenseModel(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: dateTimeFromTimestamp((json['date'] as num).toInt()),
      category: json['category'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$ExpenseModelToJson(_ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': dateTimeToTimestamp(instance.date),
      'category': instance.category,
      'note': instance.note,
    };

_CreateExpenseRequestModel _$CreateExpenseRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateExpenseRequestModel(
  amount: (json['amount'] as num).toDouble(),
  date: dateTimeFromJson(json['date']),
  category: json['category'] as String,
  note: json['note'] as String,
);

Map<String, dynamic> _$CreateExpenseRequestModelToJson(
  _CreateExpenseRequestModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'date': dateTimeToJson(instance.date),
  'category': instance.category,
  'note': instance.note,
};
