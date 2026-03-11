import 'package:flutter/material.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class AnalyticsSummaryCard extends StatelessWidget {
  final AnalyticsSnapshot data;
  const AnalyticsSummaryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final total = data.subscriptionMonthlyTotal + data.variableMonthlyTotal;
    return OrbitCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _KPI(
              label: l10n.analytics_label_subscriptions,
              value: data.subscriptionMonthlyTotal,
              color: AppColors.neonGreen),
          _KPI(
              label: l10n.analytics_label_variable,
              value: data.variableMonthlyTotal,
              color: AppColors.electricBlue),
          _KPI(label: 'Total', value: total, color: AppColors.mutedGray),
        ],
      ),
    );
  }
}

class _KPI extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const _KPI(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: AppTypography.labelSmall()),
          const SizedBox(height: 4),
          GlowText(value.toKRW(), fontSize: 14, color: color),
        ],
      );
}
