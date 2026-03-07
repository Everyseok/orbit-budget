import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/settings/repositories/settings_repository.dart';
import 'package:orbit_budget/shared/models/budget_setting_model.dart';

class IsarSettingsRepository implements SettingsRepository {
  // ignore: unused_field
  final IsarService _isarService;
  IsarSettingsRepository(this._isarService);

  @override
  Future<BudgetSettingModel> getBudgetSetting() async =>
      BudgetSettingModel.defaults(); // Stage 2 fills real Isar read

  @override
  Future<void> saveBudgetSetting(BudgetSettingModel setting) async {}
  // Stage 2 fills: await _isarService.db.writeTxn(...)

  @override
  Stream<BudgetSettingModel> watchBudgetSetting() =>
      Stream.value(BudgetSettingModel.defaults());
  // Stage 2 fills: _isarService.db.budgetSettings.watchObject(...)
}
