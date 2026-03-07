import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';

part 'budget_setting.g.dart';

@Collection()
class BudgetSetting {
  // Singleton: always use id = AppConstants.budgetSettingId
  Id id = AppConstants.budgetSettingId;
  int monthlyBudget = AppConstants.defaultMonthlyBudget;
  String currency = AppConstants.defaultCurrency;
  // Stage 3 reserved:
  // bool enableAnalyticsGraph = false;
  // String preferredGraphPreset = 'default';
  // bool screenTimeIntegration = false;
}
