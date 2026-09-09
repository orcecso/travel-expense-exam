import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/api_exception.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';
import 'package:travel_expense_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(model.toEntity());
    } on ApiException catch (error) {
      if (error.statusCode == 401) {
        return Left(AuthFailure(error.message));
      }
      return Left(ServerFailure(error.message));
    }
  }
}
