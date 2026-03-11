import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SpendingLineChart extends StatelessWidget {
  final List<DailyTotal> dailyTotals;
  const SpendingLineChart({super.key, required this.dailyTotals});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (dailyTotals.isEmpty) return const SizedBox.shrink();

    final maxY = dailyTotals.map((d) => d.total).reduce(math.max).toDouble();
    final spots = dailyTotals
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.total.toDouble()))
        .toList();

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.analytics_label_dailyTrend),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: LineChart(LineChartData(
              minY: 0,
              maxY: maxY > 0 ? maxY * 1.2 : 1,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: AppColors.mutedGray.withValues(alpha: 0.2),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(show: false),
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
                    interval: 7,
                    getTitlesWidget: (value, _) {
                      final idx = value.toInt();
                      if (idx < 0 || idx >= dailyTotals.length) {
                        return const SizedBox.shrink();
                      }
                      final d = dailyTotals[idx].date;
                      return Text(
                        '${d.month}/${d.day}',
                        style: AppTypography.labelSmall().copyWith(fontSize: 9),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: AppColors.electricBlue,
                  barWidth: 2,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.electricBlue.withValues(alpha: 0.1),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
