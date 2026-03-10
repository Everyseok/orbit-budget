import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/features/settings/providers/settings_providers.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class BudgetFuelGauge extends ConsumerWidget {
  const BudgetFuelGauge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final spent = ref.watch(monthlyExpenseTotalProvider);
    final budget = ref.watch(budgetSettingProvider).value?.monthlyBudget ??
        AppConstants.defaultMonthlyBudget;
    final ratio = budget == 0 ? 0.0 : (spent / budget).clamp(0.0, 1.0);
    final remaining = (budget - spent).clamp(0, budget);
    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.dashboard_label_fuelGauge),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 12,
              backgroundColor: AppColors.deepSpace,
              color: ratio > 0.9 ? AppColors.alertRed : AppColors.electricBlue,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(spent.toKRW(), style: AppTypography.labelSmall()),
              Text(
                '${l10n.dashboard_label_remaining} ${remaining.toKRW()}',
                style: AppTypography.labelSmall(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
