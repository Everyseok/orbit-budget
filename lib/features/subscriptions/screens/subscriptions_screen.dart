import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/subscriptions/providers/subscription_providers.dart';
import 'package:orbit_budget/features/subscriptions/widgets/add_subscription_sheet.dart';
import 'package:orbit_budget/features/subscriptions/widgets/subscription_card.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_bottom_sheet.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SubscriptionsScreen extends ConsumerWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final subsAsync = ref.watch(subscriptionListProvider);
    final total = ref.watch(activeSubscriptionTotalProvider);
    final count = ref.watch(activeSubscriptionCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.subscription_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => OrbitBottomSheet.show(
              context: context,
              title: l10n.subscription_button_add,
              child: const AddSubscriptionSheet(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                          title: l10n.subscription_label_monthlyTotal),
                      Text(total.toKRW(),
                          style: AppTypography.amount(fontSize: 24)),
                    ],
                  ),
                ),
                Text(
                  l10n.subscription_label_activeCount(count),
                  style: AppTypography.labelSmall(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: subsAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.electricBlue),
                ),
                error: (_, __) => Center(
                  child: Text(l10n.common_label_error),
                ),
                data: (list) {
                  if (list.isEmpty) {
                    return EmptyStateWidget(
                      message: l10n.common_label_empty,
                      icon: Icons.satellite_alt_outlined,
                    );
                  }
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, i) =>
                        SubscriptionCard(item: list[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
