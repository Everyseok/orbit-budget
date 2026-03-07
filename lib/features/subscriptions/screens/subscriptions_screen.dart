import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/shared/widgets/status_badge.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SubscriptionsScreen extends ConsumerWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.subscription_title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: l10n.subscription_label_monthlyTotal),
            const SizedBox(height: 12),
            const OrbitCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusBadge(status: SubscriptionStatus.active),
                  StatusBadge(status: SubscriptionStatus.paused),
                  StatusBadge(status: SubscriptionStatus.cancelling),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: EmptyStateWidget(
                message: l10n.placeholder_stage2,
                icon: Icons.satellite_alt_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
