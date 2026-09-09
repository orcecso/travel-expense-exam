import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';
import 'package:travel_expense_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) {
    if (email.trim().isEmpty || !email.contains('@')) {
      return Future.value(
        const Left(ValidationFailure('Enter a valid email address.')),
      );
    }
    if (password.isEmpty) {
      return Future.value(
        const Left(ValidationFailure('Password is required.')),
      );
    }
    return repository.login(email: email.trim(), password: password);
  }
}
