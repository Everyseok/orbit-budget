import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/database/models/debt_account.dart';
import 'package:orbit_budget/core/database/models/expense_entry.dart';
import 'package:orbit_budget/core/database/models/payment_log.dart';
import 'package:orbit_budget/core/database/models/subscription_item.dart';
import 'package:orbit_budget/core/services/preferences_service.dart';
import 'package:orbit_budget/features/settings/repositories/isar_settings_repository.dart';
import 'package:orbit_budget/features/settings/repositories/settings_repository.dart';
import 'package:orbit_budget/shared/models/budget_setting_model.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) =>
    IsarSettingsRepository(ref.watch(isarServiceProvider)));

final budgetSettingProvider = StreamProvider<BudgetSettingModel>((ref) =>
    ref.watch(settingsRepositoryProvider).watchBudgetSetting());

final notificationsEnabledProvider = StateProvider<bool>((ref) =>
    ref.watch(preferencesServiceProvider).notificationsEnabled);

class BudgetSettingNotifier extends StateNotifier<AsyncValue<void>> {
  final SettingsRepository _repo;
  BudgetSettingNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> save(BudgetSettingModel m) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.saveBudgetSetting(m));
  }
}

final budgetSettingNotifierProvider =
    StateNotifierProvider<BudgetSettingNotifier, AsyncValue<void>>((ref) =>
        BudgetSettingNotifier(ref.watch(settingsRepositoryProvider)));

// ── Reset data ────────────────────────────────────────────────────────

class ResetDataNotifier extends StateNotifier<AsyncValue<void>> {
  final IsarService _svc;
  ResetDataNotifier(this._svc) : super(const AsyncValue.data(null));

  Future<void> reset() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final db = _svc.db;
      await db.writeTxn(() async {
        await db.expenseEntrys.clear();
        await db.subscriptionItems.clear();
        await db.debtAccounts.clear();
        await db.paymentLogs.clear();
      });
    });
  }
}

final resetDataProvider =
    StateNotifierProvider<ResetDataNotifier, AsyncValue<void>>(
        (ref) => ResetDataNotifier(ref.watch(isarServiceProvider)));
