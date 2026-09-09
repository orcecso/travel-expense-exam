import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_expense_app/core/config/app_config.dart';
import 'package:travel_expense_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travel_expense_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:travel_expense_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:travel_expense_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:travel_expense_app/features/expenses/data/datasources/expense_remote_data_source.dart';
import 'package:travel_expense_app/features/expenses/data/repositories/expense_repository_impl.dart';
import 'package:travel_expense_app/features/expenses/domain/repositories/expense_repository.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/add_expense_use_case.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/get_expense_by_id_use_case.dart';
import 'package:travel_expense_app/features/expenses/domain/usecases/get_expenses_use_case.dart';

final getIt = GetIt.instance;

void configureDependencies({String baseUrl = AppConfig.apiBaseUrl}) {
  getIt
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          headers: const {'Accept': 'application/json'},
        ),
      ),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt()),
    )
    ..registerFactory(() => LoginUseCase(getIt()))
    ..registerLazySingleton<ExpenseRemoteDataSource>(
      () => ExpenseRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<ExpenseRepository>(
      () => ExpenseRepositoryImpl(getIt()),
    )
    ..registerFactory(() => GetExpensesUseCase(getIt()))
    ..registerFactory(() => GetExpenseByIdUseCase(getIt()))
    ..registerFactory(() => AddExpenseUseCase(getIt()));
}
