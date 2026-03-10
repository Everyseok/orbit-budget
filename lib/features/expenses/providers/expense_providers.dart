import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/extensions/datetime_ext.dart';
import 'package:orbit_budget/features/expenses/repositories/expense_repository.dart';
import 'package:orbit_budget/features/expenses/repositories/isar_expense_repository.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) =>
    IsarExpenseRepository(ref.watch(isarServiceProvider)));

final expenseListProvider = StreamProvider<List<ExpenseModel>>((ref) =>
    ref.watch(expenseRepositoryProvider).watchAll());

final currentMonthExpensesProvider = StreamProvider<List<ExpenseModel>>((ref) {
  final now = DateTime.now();
  return ref.watch(expenseRepositoryProvider).watchByMonth(now.year, now.month);
});

final todayExpenseTotalProvider = Provider<int>((ref) {
  final today = DateTime.now();
  return ref.watch(currentMonthExpensesProvider).when(
    data: (list) => list
        .where((e) => e.date.isSameDay(today))
        .fold(0, (s, e) => s + e.amount),
    loading: () => 0,
    error: (_, __) => 0,
  );
});

final monthlyExpenseTotalProvider = Provider<int>((ref) =>
    ref.watch(currentMonthExpensesProvider).when(
      data: (list) => list.fold(0, (s, e) => s + e.amount),
      loading: () => 0,
      error: (_, __) => 0,
    ));

class ExpenseFormNotifier extends StateNotifier<AsyncValue<void>> {
  final ExpenseRepository _repo;
  ExpenseFormNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> add({
    required int amount,
    required CategoryType category,
    required String memo,
    required DateTime date,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.add(ExpenseModel(
          id: 0,
          date: date,
          amount: amount,
          category: category,
          memo: memo,
        )));
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.delete(id));
  }
}

final expenseFormProvider =
    StateNotifierProvider<ExpenseFormNotifier, AsyncValue<void>>((ref) =>
        ExpenseFormNotifier(ref.watch(expenseRepositoryProvider)));
