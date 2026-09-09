import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_expense_app/core/error/api_exception.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:travel_expense_app/features/auth/data/models/user_model.dart';
import 'package:travel_expense_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthRemoteDataSource remoteDataSource;
  late AuthRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(remoteDataSource);
  });

  test('returns User when remote login succeeds', () async {
    const model = UserModel(
      id: '1',
      email: 'engineer@example.com',
      name: 'Engineer',
      password: 'secret123',
    );
    const expected = User(
      id: '1',
      email: 'engineer@example.com',
      name: 'Engineer',
    );

    when(
      () => remoteDataSource.login(
        email: 'engineer@example.com',
        password: 'secret123',
      ),
    ).thenAnswer((_) async => model);

    final result = await repository.login(
      email: 'engineer@example.com',
      password: 'secret123',
    );

    expect(result, const Right(expected));
    verify(
      () => remoteDataSource.login(
        email: 'engineer@example.com',
        password: 'secret123',
      ),
    ).called(1);
  });

  test('returns AuthFailure for invalid credentials', () async {
    when(
      () => remoteDataSource.login(
        email: 'engineer@example.com',
        password: 'wrong',
      ),
    ).thenThrow(
      const ApiException('Invalid email or password.', statusCode: 401),
    );

    final result = await repository.login(
      email: 'engineer@example.com',
      password: 'wrong',
    );

    expect(
      result,
      const Left(AuthFailure('Invalid email or password.')),
    );
  });
}
