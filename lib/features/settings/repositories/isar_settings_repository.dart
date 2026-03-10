import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/database/models/budget_setting.dart';
import 'package:orbit_budget/features/settings/repositories/settings_repository.dart';
import 'package:orbit_budget/shared/models/budget_setting_model.dart';

class IsarSettingsRepository implements SettingsRepository {
  final IsarService _svc;
  IsarSettingsRepository(this._svc);

  Isar get _db => _svc.db;

  @override
  Future<BudgetSettingModel> getBudgetSetting() async {
    final e = await _db.budgetSettings.get(AppConstants.budgetSettingId);
    return e != null
        ? BudgetSettingModel.fromEntity(e)
        : BudgetSettingModel.defaults();
  }

  @override
  Future<void> saveBudgetSetting(BudgetSettingModel m) async {
    final e = BudgetSetting()
      ..id = AppConstants.budgetSettingId
      ..monthlyBudget = m.monthlyBudget
      ..currency = m.currency;
    await _db.writeTxn(() => _db.budgetSettings.put(e));
  }

  @override
  Stream<BudgetSettingModel> watchBudgetSetting() =>
      _db.budgetSettings
          .watchObject(AppConstants.budgetSettingId, fireImmediately: true)
          .map((e) => e != null
              ? BudgetSettingModel.fromEntity(e)
              : BudgetSettingModel.defaults());
}
