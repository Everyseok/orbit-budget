import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
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
