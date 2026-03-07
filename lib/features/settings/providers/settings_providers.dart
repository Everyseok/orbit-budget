import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/services/preferences_service.dart';
import 'package:orbit_budget/features/settings/repositories/isar_settings_repository.dart';
import 'package:orbit_budget/features/settings/repositories/settings_repository.dart';
import 'package:orbit_budget/shared/models/budget_setting_model.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return IsarSettingsRepository(ref.watch(isarServiceProvider));
});

final budgetSettingProvider = StreamProvider<BudgetSettingModel>((ref) {
  return ref.watch(settingsRepositoryProvider).watchBudgetSetting();
});

final notificationsEnabledProvider = Provider<bool>((ref) {
  return ref.watch(preferencesServiceProvider).notificationsEnabled;
});
