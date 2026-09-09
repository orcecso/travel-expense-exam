import 'package:dio/dio.dart';
import 'package:travel_expense_app/core/error/api_exception.dart';
import 'package:travel_expense_app/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  const AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.get<List<dynamic>>(
        '/users',
        queryParameters: {'email': email},
      );
      final records = response.data ?? const [];

      for (final record in records) {
        if (record is! Map<String, dynamic>) {
          continue;
        }
        final user = UserModel.fromJson(record);
        if (user.email.toLowerCase() == email.toLowerCase() &&
            user.password == password) {
          return user;
        }
      }

      throw const ApiException(
        'Invalid email or password.',
        statusCode: 401,
      );
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
