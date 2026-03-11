import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DebtProjectionCard extends StatelessWidget {
  final DebtProjection projection;
  const DebtProjectionCard({super.key, required this.projection});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final clearDate = projection.estimatedClearDate;

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.analytics_label_debtProjection),
          const SizedBox(height: 12),
          GlowText(
            l10n.analytics_label_projectedMonths(
                projection.estimatedMonthsRemaining),
            fontSize: 28,
            color: projection.estimatedMonthsRemaining <= 6
                ? AppColors.neonGreen
                : AppColors.electricBlue,
          ),
          if (clearDate != null) ...[
            const SizedBox(height: 4),
            Text(
              l10n.analytics_label_projectedDate(
                  '${clearDate.year}.'
                  '${clearDate.month.toString().padLeft(2, '0')}'),
              style: AppTypography.labelSmall(),
            ),
          ],
        ],
      ),
    );
  }
}
