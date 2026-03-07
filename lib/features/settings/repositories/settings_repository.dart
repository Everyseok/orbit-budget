import 'package:orbit_budget/shared/models/budget_setting_model.dart';

abstract class SettingsRepository {
  Future<BudgetSettingModel> getBudgetSetting();
  Future<void> saveBudgetSetting(BudgetSettingModel setting);
  Stream<BudgetSettingModel> watchBudgetSetting();
}
