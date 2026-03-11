import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/subscriptions/providers/subscription_providers.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SubscriptionCostRankingWidget extends ConsumerWidget {
  const SubscriptionCostRankingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final subs = ref.watch(subscriptionListProvider).valueOrNull ?? [];
    final active = [
      ...subs.where((s) => s.status == SubscriptionStatus.active)
    ]..sort((a, b) => b.monthlyCost.compareTo(a.monthlyCost));

    if (active.isEmpty) return const SizedBox.shrink();

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.analytics_label_costRanking),
          const SizedBox(height: 8),
          ...active.asMap().entries.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(children: [
                  SizedBox(
                    width: 24,
                    child: Text(
                      '${e.key + 1}',
                      style: AppTypography.labelSmall().copyWith(
                          color: e.key == 0
                              ? AppColors.alertRed
                              : AppColors.mutedGray,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(e.value.logoEmoji,
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(e.value.name,
                          style: AppTypography.bodyMedium())),
                  GlowText(
                    e.value.monthlyCost.toKRW(),
                    fontSize: 13,
                    color: e.key == 0
                        ? AppColors.alertRed
                        : AppColors.electricBlue,
                  ),
                ]),
              )),
        ],
      ),
    );
  }
}
