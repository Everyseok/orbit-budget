import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class MonthlyBarChart extends StatelessWidget {
  final List<MonthlyTotal> monthlyTotals;
  const MonthlyBarChart({super.key, required this.monthlyTotals});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (monthlyTotals.length < 2) {
      return OrbitCard(
        child: EmptyStateWidget(message: l10n.analytics_label_insufficientData),
      );
    }
    final maxY = monthlyTotals.map((m) => m.total).reduce(math.max).toDouble();
    final groups = monthlyTotals
        .asMap()
        .entries
        .map((e) => BarChartGroupData(x: e.key, barRods: [
              BarChartRodData(
                toY: e.value.total.toDouble(),
                color: AppColors.electricBlue,
                width: 18,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: maxY * 1.2,
                  color: AppColors.deepSpace,
                ),
              ),
            ]))
        .toList();

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.analytics_label_monthlyComparison),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: BarChart(BarChartData(
              maxY: maxY > 0 ? maxY * 1.2 : 1,
              barGroups: groups,
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      final idx = value.toInt();
                      if (idx < 0 || idx >= monthlyTotals.length) {
                        return const SizedBox.shrink();
                      }
                      return Text(
                        '${monthlyTotals[idx].month}월',
                        style:
                            AppTypography.labelSmall().copyWith(fontSize: 10),
                      );
                    },
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
