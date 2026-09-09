import 'package:dartz/dartz.dart';
import 'package:travel_expense_app/core/error/failure.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
}
