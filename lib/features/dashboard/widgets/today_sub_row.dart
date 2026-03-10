import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/features/subscriptions/providers/subscription_providers.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class TodaySubRow extends ConsumerWidget {
  const TodaySubRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final todayTotal = ref.watch(todayExpenseTotalProvider);
    final subsTotal = ref.watch(activeSubscriptionTotalProvider);
    return Row(
      children: [
        Expanded(
          child: OrbitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: l10n.dashboard_label_todayBurn),
                const SizedBox(height: 8),
                GlowText(todayTotal.toKRW(), fontSize: 18,
                    color: AppColors.neonGreen),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OrbitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: l10n.dashboard_label_monthlySubscriptions),
                const SizedBox(height: 8),
                GlowText(subsTotal.toKRW(), fontSize: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
