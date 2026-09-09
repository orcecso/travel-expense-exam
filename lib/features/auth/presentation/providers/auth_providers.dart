import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_expense_app/core/dependency_injection/injection.dart';
import 'package:travel_expense_app/features/auth/domain/entities/user.dart';
import 'package:travel_expense_app/features/auth/domain/usecases/login_use_case.dart';

part 'auth_providers.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) => getIt<LoginUseCase>();

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<User?> build() => null;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await ref.read(loginUseCaseProvider).call(
          email: email,
          password: password,
        );

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (user) {
        state = AsyncData(user);
        return true;
      },
    );
  }

  void logout() {
    state = const AsyncData(null);
  }
}
