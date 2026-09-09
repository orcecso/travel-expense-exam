import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_expense_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:travel_expense_app/features/auth/presentation/screens/login_screen.dart';
import 'package:travel_expense_app/features/expenses/presentation/screens/add_expense_screen.dart';
import 'package:travel_expense_app/features/expenses/presentation/screens/expense_detail_screen.dart';
import 'package:travel_expense_app/features/expenses/presentation/screens/expense_list_screen.dart';
import 'package:travel_expense_app/features/navigation/presentation/widgets/main_shell.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _expensesNavigatorKey = GlobalKey<NavigatorState>();
final _addNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(Ref ref) {
  final auth = ref.watch(authControllerProvider);
  final isLoggedIn = auth.asData?.value != null;

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final onLogin = state.matchedLocation == '/login';
      if (!isLoggedIn && !onLogin) {
        return '/login';
      }
      if (isLoggedIn && onLogin) {
        return '/expenses';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _expensesNavigatorKey,
            routes: [
              GoRoute(
                path: '/expenses',
                builder: (context, state) => const ExpenseListScreen(),
                routes: [
                  GoRoute(
                    path: ':expenseId',
                    builder: (context, state) => ExpenseDetailScreen(
                      expenseId: state.pathParameters['expenseId']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _addNavigatorKey,
            routes: [
              GoRoute(
                path: '/add-expense',
                builder: (context, state) => const AddExpenseScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
