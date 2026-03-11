import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/services/csv_export_service.dart';
import 'package:orbit_budget/core/utils/analytics_utils.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/features/analytics/models/graph_preset_model.dart';
import 'package:orbit_budget/features/analytics/repositories/graph_preset_repository.dart';
import 'package:orbit_budget/features/analytics/repositories/isar_graph_preset_repository.dart';
import 'package:orbit_budget/features/debt/providers/debt_providers.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/features/expenses/repositories/expense_repository.dart';
import 'package:orbit_budget/features/subscriptions/providers/subscription_providers.dart';
import 'package:orbit_budget/features/subscriptions/repositories/subscription_repository.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

// ── Graph preset providers ────────────────────────────────────────────

final graphPresetRepositoryProvider = Provider<GraphPresetRepository>(
    (ref) => IsarGraphPresetRepository(ref.watch(isarServiceProvider)));

final graphPresetListProvider = StreamProvider<List<GraphPresetModel>>(
    (ref) => ref.watch(graphPresetRepositoryProvider).watchAll());

final selectedPresetProvider = StateProvider<GraphPresetModel?>((ref) => null);

class GraphPresetNotifier extends StateNotifier<AsyncValue<void>> {
  final GraphPresetRepository _repo;
  GraphPresetNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> save(GraphPresetModel p) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.save(p));
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.delete(id));
  }
}

final graphPresetNotifierProvider =
    StateNotifierProvider<GraphPresetNotifier, AsyncValue<void>>(
        (ref) => GraphPresetNotifier(ref.watch(graphPresetRepositoryProvider)));

// ── Analytics snapshot ────────────────────────────────────────────────

final analyticsSnapshotProvider = FutureProvider<AnalyticsSnapshot>((ref) async {
  final now = DateTime.now();
  final sixMonthsAgo = DateTime(now.year, now.month - 6, 1);

  final expenseRepo = ref.watch(expenseRepositoryProvider);
  final expenses = await expenseRepo.getByDateRange(sixMonthsAgo, now);

  final subTotal = ref.watch(activeSubscriptionTotalProvider);
  final accounts = ref.watch(debtAccountsProvider).valueOrNull ?? [];

  final debtRepo = ref.watch(debtRepositoryProvider);
  final allPayments = <PaymentLogModel>[];
  for (final a in accounts) {
    final logs = await debtRepo.watchPayments(a.id).first;
    allPayments.addAll(logs);
  }

  final thisMonth = expenses
      .where((e) => e.date.year == now.year && e.date.month == now.month)
      .toList();

  return AnalyticsSnapshot(
    categoryTotals: AnalyticsUtils.categoryTotals(thisMonth),
    dailyTotals: AnalyticsUtils.dailyTotals(expenses, now),
    monthlyTotals: AnalyticsUtils.monthlyTotals(expenses, now),
    subscriptionMonthlyTotal: subTotal,
    variableMonthlyTotal: thisMonth.fold(0, (s, e) => s + e.amount),
    debtProjection: AnalyticsUtils.debtProjection(accounts, allPayments),
    hasData: expenses.isNotEmpty,
  );
});

// ── CSV export notifier ───────────────────────────────────────────────

class ExportNotifier extends StateNotifier<AsyncValue<void>> {
  final ExpenseRepository _expRepo;
  final SubscriptionRepository _subRepo;
  ExportNotifier(this._expRepo, this._subRepo)
      : super(const AsyncValue.data(null));

  Future<void> exportExpenses() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final all = await _expRepo.watchAll().first;
      await CsvExportService.exportExpenses(all);
    });
  }

  Future<void> exportSubscriptions() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final all = await _subRepo.watchAll().first;
      await CsvExportService.exportSubscriptions(all);
    });
  }
}

final exportProvider =
    StateNotifierProvider<ExportNotifier, AsyncValue<void>>((ref) => ExportNotifier(
          ref.watch(expenseRepositoryProvider),
          ref.watch(subscriptionRepositoryProvider),
        ));

// ── Debug sample data seeder (kDebugMode only) ────────────────────────

class SampleDataNotifier extends StateNotifier<AsyncValue<void>> {
  final ExpenseRepository _repo;
  SampleDataNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> seed() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final now = DateTime.now();
      final rand = math.Random(42); // deterministic
      const cats = CategoryType.values;
      for (int i = 0; i < 90; i++) {
        final date = now.subtract(Duration(days: i));
        for (int j = 0; j < rand.nextInt(4) + 1; j++) {
          await _repo.add(ExpenseModel(
            id: 0,
            date: date,
            amount: (rand.nextInt(50) + 5) * 1000,
            category: cats[rand.nextInt(cats.length)],
            memo: '',
          ));
        }
      }
    });
  }
}

final sampleDataProvider =
    StateNotifierProvider<SampleDataNotifier, AsyncValue<void>>(
        (ref) => SampleDataNotifier(ref.watch(expenseRepositoryProvider)));
