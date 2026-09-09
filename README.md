# Travel Expense App

Small Flutter travel-expense reporting app 

## Requirements covered

- Mock API login with email and password
- Expense list from REST API
- Expense detail screen
- Add-expense form with validation for amount, date, category, and note
- Loading, error, retry, and empty states
- Riverpod code generation using `@riverpod` and generated `AsyncNotifier`-style controllers
- Feature-first Clean Architecture with `data`, `domain`, and `presentation` separation
- `freezed` + `json_serializable` models
- `build_runner` setup
- `dartz` `Either<Failure, T>` repository/use-case boundaries
- `get_it` dependency injection
- Dio networking
- `go_router` `StatefulShellRoute.indexedStack` navigation
- Unit tests for data and domain layers

## Flutter / Dart

Target development environment:

Flutter 3.47.2
Dart 3.13.2


Recommended first-run sequence:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run --dart-define=API_BASE_URL=https://6aa0077e3e0d88d3d7e54fe9.mockapi.io/v1/
```

Use the email/password from the `users` record created in MockAPI.
