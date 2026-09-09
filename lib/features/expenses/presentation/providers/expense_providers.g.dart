// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getExpensesUseCase)
final getExpensesUseCaseProvider = GetExpensesUseCaseProvider._();

final class GetExpensesUseCaseProvider
    extends
        $FunctionalProvider<
          GetExpensesUseCase,
          GetExpensesUseCase,
          GetExpensesUseCase
        >
    with $Provider<GetExpensesUseCase> {
  GetExpensesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExpensesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExpensesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExpensesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetExpensesUseCase create(Ref ref) {
    return getExpensesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExpensesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExpensesUseCase>(value),
    );
  }
}

String _$getExpensesUseCaseHash() =>
    r'20229ad5dc820e54e7b6c5cb3a1039ca1c8c1a34';

@ProviderFor(getExpenseByIdUseCase)
final getExpenseByIdUseCaseProvider = GetExpenseByIdUseCaseProvider._();

final class GetExpenseByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetExpenseByIdUseCase,
          GetExpenseByIdUseCase,
          GetExpenseByIdUseCase
        >
    with $Provider<GetExpenseByIdUseCase> {
  GetExpenseByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExpenseByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExpenseByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExpenseByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetExpenseByIdUseCase create(Ref ref) {
    return getExpenseByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExpenseByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExpenseByIdUseCase>(value),
    );
  }
}

String _$getExpenseByIdUseCaseHash() =>
    r'39a005c665736d129d1d3f92e450823064b47d0f';

@ProviderFor(addExpenseUseCase)
final addExpenseUseCaseProvider = AddExpenseUseCaseProvider._();

final class AddExpenseUseCaseProvider
    extends
        $FunctionalProvider<
          AddExpenseUseCase,
          AddExpenseUseCase,
          AddExpenseUseCase
        >
    with $Provider<AddExpenseUseCase> {
  AddExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExpenseUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddExpenseUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddExpenseUseCase create(Ref ref) {
    return addExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddExpenseUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddExpenseUseCase>(value),
    );
  }
}

String _$addExpenseUseCaseHash() => r'0d4c7ada40b95f45b300be792298ae5e52d4c051';

@ProviderFor(ExpenseListController)
final expenseListControllerProvider = ExpenseListControllerProvider._();

final class ExpenseListControllerProvider
    extends $AsyncNotifierProvider<ExpenseListController, List<Expense>> {
  ExpenseListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseListControllerHash();

  @$internal
  @override
  ExpenseListController create() => ExpenseListController();
}

String _$expenseListControllerHash() =>
    r'835509a7e2a5a14799f6bbf99dcf8c5b7e580b4a';

abstract class _$ExpenseListController extends $AsyncNotifier<List<Expense>> {
  FutureOr<List<Expense>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Expense>>, List<Expense>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expense>>, List<Expense>>,
              AsyncValue<List<Expense>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(expenseDetail)
final expenseDetailProvider = ExpenseDetailFamily._();

final class ExpenseDetailProvider
    extends $FunctionalProvider<AsyncValue<Expense>, Expense, FutureOr<Expense>>
    with $FutureModifier<Expense>, $FutureProvider<Expense> {
  ExpenseDetailProvider._({
    required ExpenseDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'expenseDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$expenseDetailHash();

  @override
  String toString() {
    return r'expenseDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Expense> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Expense> create(Ref ref) {
    final argument = this.argument as String;
    return expenseDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$expenseDetailHash() => r'd406cd47d55cb67ad4c0f5cc2170b324584ef803';

final class ExpenseDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Expense>, String> {
  ExpenseDetailFamily._()
    : super(
        retry: null,
        name: r'expenseDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExpenseDetailProvider call(String id) =>
      ExpenseDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'expenseDetailProvider';
}

@ProviderFor(AddExpenseController)
final addExpenseControllerProvider = AddExpenseControllerProvider._();

final class AddExpenseControllerProvider
    extends $AsyncNotifierProvider<AddExpenseController, void> {
  AddExpenseControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExpenseControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addExpenseControllerHash();

  @$internal
  @override
  AddExpenseController create() => AddExpenseController();
}

String _$addExpenseControllerHash() =>
    r'672cd33056d0be24ecde372f6add47dcacd03051';

abstract class _$AddExpenseController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
