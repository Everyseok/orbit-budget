import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class CategoryPieChart extends StatelessWidget {
  final Map<CategoryType, int> categoryTotals;
  const CategoryPieChart({super.key, required this.categoryTotals});

  static const _colors = [
    AppColors.electricBlue,
    AppColors.neonGreen,
    AppColors.alertRed,
    Color(0xFFFFB347),
    Color(0xFFAA44FF),
    Color(0xFF44DDBB),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (categoryTotals.isEmpty) {
      return EmptyStateWidget(message: l10n.analytics_label_noData);
    }
    final total = categoryTotals.values.fold(0, (s, v) => s + v);
    final entries = categoryTotals.entries.toList();

    final sections = entries.asMap().entries.map((e) {
      final pct = total > 0 ? e.value.value / total * 100 : 0.0;
      return PieChartSectionData(
        value: pct,
        title: '${e.value.key.emoji}\n${pct.toStringAsFixed(0)}%',
        color: _colors[e.key % _colors.length],
        radius: 80,
        titleStyle: AppTypography.labelSmall()
            .copyWith(fontSize: 10, color: AppColors.spaceBlack),
      );
    }).toList();

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.analytics_label_categoryBreakdown),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: PieChart(PieChartData(
              sections: sections,
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            )),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: entries.asMap().entries.map((e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: _colors[e.key % _colors.length],
                            shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    Text(
                      '${e.value.key.emoji} ${e.value.value.toKRW()}',
                      style: AppTypography.labelSmall(),
                    ),
                  ],
                )).toList(),
          ),
        ],
      ),
    );
  }
}
