import 'package:dio/dio.dart';
import 'package:travel_expense_app/core/error/api_exception.dart';
import 'package:travel_expense_app/features/expenses/data/models/expense_model.dart';

abstract interface class ExpenseRemoteDataSource {
  Future<List<ExpenseModel>> getExpenses();
  Future<ExpenseModel> getExpenseById(String id);
  Future<ExpenseModel> addExpense(CreateExpenseRequestModel request);
}

class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final Dio dio;

  const ExpenseRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    try {
      final response = await dio.get<List<dynamic>>('/expenses');
      final records = response.data ?? const [];
      return records
          .whereType<Map<String, dynamic>>()
          .map(ExpenseModel.fromJson)
          .toList();
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }

  @override
  Future<ExpenseModel> getExpenseById(String id) async {
    try {
      final response = await dio.get<Map<String, dynamic>>('/expenses/$id');
      final data = response.data;
      if (data == null) {
        throw const ApiException('Expense not found.', statusCode: 404);
      }
      return ExpenseModel.fromJson(data);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }

  @override
  Future<ExpenseModel> addExpense(CreateExpenseRequestModel request) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/expenses',
        data: request.toJson(),
      );
      final data = response.data;
      if (data == null) {
        throw const ApiException('Expense was not created.');
      }
      return ExpenseModel.fromJson(data);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
