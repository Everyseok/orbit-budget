import 'package:flutter/material.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class StatusBadge extends StatelessWidget {
  final SubscriptionStatus status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final (Color bg, String label) = switch (status) {
      SubscriptionStatus.active => (
          AppColors.greenSubtle,
          l10n.subscription_label_active
        ),
      SubscriptionStatus.paused => (
          AppColors.blueSubtle,
          l10n.subscription_label_paused
        ),
      SubscriptionStatus.cancelling => (
          AppColors.redSubtle,
          l10n.subscription_label_cancelling
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall().copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
