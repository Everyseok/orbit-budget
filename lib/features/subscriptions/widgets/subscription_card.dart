import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/extensions/datetime_ext.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/subscriptions/providers/subscription_providers.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';
import 'package:orbit_budget/shared/widgets/confirm_dialog.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/status_badge.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SubscriptionCard extends ConsumerWidget {
  final SubscriptionModel item;
  const SubscriptionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(subscriptionFormProvider.notifier);
    final isPaused = item.status == SubscriptionStatus.paused;

    return Slidable(
      key: ValueKey(item.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => notifier.updateStatus(
              item,
              isPaused ? SubscriptionStatus.active : SubscriptionStatus.paused,
            ),
            backgroundColor: AppColors.blueSubtle,
            foregroundColor: AppColors.white,
            icon: isPaused ? Icons.play_arrow : Icons.pause,
            label: isPaused
                ? l10n.subscription_action_resume
                : l10n.subscription_action_pause,
          ),
          SlidableAction(
            onPressed: (_) async {
              final confirmed = await ConfirmDialog.show(
                context: context,
                title: l10n.subscription_action_delete,
                message: l10n.subscription_confirm_delete(item.name),
                confirmLabel: l10n.common_button_delete,
                isDangerous: true,
              );
              if (confirmed) await notifier.delete(item.id);
            },
            backgroundColor: AppColors.alertRed,
            foregroundColor: AppColors.white,
            icon: Icons.delete_outline,
            label: l10n.subscription_action_delete,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: OrbitCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(item.logoEmoji,
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: AppTypography.headlineMedium()
                                .copyWith(fontSize: 15)),
                        Text(
                          '${l10n.subscription_label_nextBilling} '
                          '${item.nextBillingDate.toBillingDisplay()}',
                          style: AppTypography.labelSmall(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${item.monthlyCost.toKRW()}${l10n.common_label_perMonth}',
                        style: AppTypography.amount(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      StatusBadge(status: item.status),
                    ],
                  ),
                ],
              ),
              if (item.manageUrl.isNotEmpty) ...[
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    final uri = Uri.parse(item.manageUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    } else if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.subscription_error_urlLaunch),
                        ),
                      );
                    }
                  },
                  child: Text(l10n.subscription_button_manage),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
