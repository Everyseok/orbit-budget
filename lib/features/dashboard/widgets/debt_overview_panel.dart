import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/constants/routes.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/debt/providers/debt_providers.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DebtOverviewPanel extends ConsumerWidget {
  const DebtOverviewPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final accounts = ref.watch(debtAccountsProvider);
    final total = ref.watch(totalDebtProvider);
    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.dashboard_label_totalDebt),
          const SizedBox(height: 8),
          GlowText(total.toKRW(), fontSize: 32),
          const SizedBox(height: 16),
          accounts.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.electricBlue),
            ),
            error: (_, __) => Text(l10n.common_label_error),
            data: (list) => Column(
              children: list.map((a) => _AccountRow(account: a)).toList(),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => context.push(Routes.debt),
            icon: const Icon(Icons.arrow_forward, size: 16),
            label: Text(l10n.dashboard_action_manageDebt),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.electricBlue,
              side: BorderSide(color: AppColors.blueSubtle),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountRow extends StatelessWidget {
  final DebtAccountModel account;
  const _AccountRow({required this.account});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final displayName = account.type == DebtAccountType.loan
        ? l10n.debt_label_loan
        : l10n.debt_label_credit;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(displayName, style: AppTypography.bodyMedium()),
              GlowText(account.currentBalance.toKRW(), fontSize: 14),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: account.progressRatio,
              backgroundColor: AppColors.deepSpace,
              color: account.progressRatio > 0.7
                  ? AppColors.neonGreen
                  : AppColors.electricBlue,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
