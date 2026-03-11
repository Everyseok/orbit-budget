import 'package:flutter/material.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SubVsVariableCard extends StatelessWidget {
  final int subTotal;
  final int variableTotal;
  const SubVsVariableCard(
      {super.key, required this.subTotal, required this.variableTotal});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final grand = subTotal + variableTotal;
    final subR = grand == 0 ? 0.0 : subTotal / grand;

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.analytics_label_subVsVariable),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 12,
              child: Row(children: [
                Flexible(
                  flex: (subR * 100).round(),
                  child: Container(color: AppColors.neonGreen),
                ),
                Flexible(
                  flex: 100 - (subR * 100).round(),
                  child: Container(color: AppColors.electricBlue),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Legend(
                  color: AppColors.neonGreen,
                  label: l10n.analytics_label_subscriptions,
                  value: subTotal),
              _Legend(
                  color: AppColors.electricBlue,
                  label: l10n.analytics_label_variable,
                  value: variableTotal),
            ],
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  final int value;
  const _Legend(
      {required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 10,
              height: 10,
              decoration:
                  BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 4),
          Text('$label ${value.toKRW()}',
              style: AppTypography.labelSmall()),
        ],
      );
}
