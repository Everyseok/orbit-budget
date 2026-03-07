import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/expenses/repositories/expense_repository.dart';
import 'package:orbit_budget/features/expenses/repositories/isar_expense_repository.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return IsarExpenseRepository(ref.watch(isarServiceProvider));
});

final expenseListProvider = StreamProvider<List<ExpenseModel>>((ref) {
  return ref.watch(expenseRepositoryProvider).watchAll();
});

// Stage 2 replaces 0 with real sum:
final todayExpenseTotalProvider = Provider<int>((ref) => 0);

final monthlyExpenseTotalProvider =
    Provider.family<int, DateTime>((ref, _) => 0);
