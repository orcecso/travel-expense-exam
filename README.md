# Travel Expense App

Small Flutter travel-expense reporting app 


## 🎬 Demo

![Travel Expense App Demo](docs/demo.mp4)

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

## key Architectual Decisions
1. Feature-First Clean Architecture

The application is organized by feature, with each feature separated into data, domain, and presentation layers.

features/
├── auth/
│   ├── data/
│   ├── domain/
│   └── presentation/
└── expenses/
    ├── data/
    ├── domain/
    └── presentation/

This keeps business logic independent from UI and API implementation details while allowing each feature to remain modular and easier to maintain, test, and extend.

2. Riverpod for State Management, GetIt for Dependency Injection

Riverpod with code generation is used for presentation state, including loading, success, and error states.

get_it is used for application-level dependency injection and is responsible for constructing dependencies such as:

Dio
 ↓
Remote Data Source
 ↓
Repository
 ↓
Use Case
 ↓
Riverpod Controller
 ↓
UI

This keeps dependency construction separate from presentation state management and makes implementations easier to replace or mock during testing.

3. Functional Error Handling with Either

Repositories and use cases return Either<Failure, T> using dartz rather than exposing exceptions directly to the presentation layer.

This provides an explicit distinction between successful and failed operations and allows the UI layer to handle failures without depending on networking or data-layer exceptions.

💡 Assumptions

The following assumptions were made for areas of the specification that were not fully defined:

Authentication is intentionally mocked using the REST API. No real authentication token, session management, Firebase, OAuth, or SSO is implemented.

Expense categories are limited to flight, hotel, restaurant, taxi, and other.

Expense dates received from MockAPI may be represented as Unix timestamps. The data layer converts API date values into Dart DateTime objects before exposing them to the domain layer.

Currency conversion and multi-currency support are outside the scope of the exercise; expense amounts are treated as a single generic monetary value.
Adding an expense persists it to MockAPI. Editing and deleting expenses were not implemented because they were not explicitly required.
Authentication credentials and MockAPI data are for demonstration purposes only and should not be considered production authentication or storage.

🧪 Tests

Run the unit tests with:

flutter test

Tests focus on the data and domain layers, including repository behavior, use cases, mapping, and error handling.