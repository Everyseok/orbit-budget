import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:orbit_budget/core/database/models/budget_setting.dart';

class BudgetSettingModel {
  final int id;
  final int monthlyBudget;
  final String currency;

  const BudgetSettingModel({
    required this.id,
    required this.monthlyBudget,
    required this.currency,
  });

  factory BudgetSettingModel.defaults() => const BudgetSettingModel(
        id: AppConstants.budgetSettingId,
        monthlyBudget: AppConstants.defaultMonthlyBudget,
        currency: AppConstants.defaultCurrency,
      );

  BudgetSettingModel copyWith({
    int? id,
    int? monthlyBudget,
    String? currency,
  }) =>
      BudgetSettingModel(
        id: id ?? this.id,
        monthlyBudget: monthlyBudget ?? this.monthlyBudget,
        currency: currency ?? this.currency,
      );

  factory BudgetSettingModel.fromEntity(BudgetSetting e) => BudgetSettingModel(
        id: e.id,
        monthlyBudget: e.monthlyBudget,
        currency: e.currency,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'monthlyBudget': monthlyBudget,
        'currency': currency,
      };

  factory BudgetSettingModel.fromJson(Map<String, dynamic> j) =>
      BudgetSettingModel(
        id: j['id'] as int,
        monthlyBudget: j['monthlyBudget'] as int,
        currency: j['currency'] as String,
      );
}
