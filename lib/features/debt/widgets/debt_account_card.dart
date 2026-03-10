import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/debt/providers/debt_providers.dart';
import 'package:orbit_budget/features/debt/widgets/log_payment_sheet.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/orbit_bottom_sheet.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DebtAccountCard extends ConsumerWidget {
  final DebtAccountModel account;
  const DebtAccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final paymentsAsync = ref.watch(paymentLogProvider(account.id));
    final displayName = account.type == DebtAccountType.loan
        ? l10n.debt_label_loan
        : l10n.debt_label_credit;

    return OrbitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: displayName),
                    GlowText(account.currentBalance.toKRW(), fontSize: 24),
                    const SizedBox(height: 4),
                    Text(
                      '${l10n.debt_label_startingBalance}: '
                      '${account.startingBalance.toKRW()}',
                      style: AppTypography.labelSmall(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: account.progressRatio,
                      backgroundColor: AppColors.deepSpace,
                      color: account.progressRatio > 0.7
                          ? AppColors.neonGreen
                          : AppColors.electricBlue,
                      strokeWidth: 8,
                    ),
                    Text(
                      '${(account.progressRatio * 100).toStringAsFixed(0)}%',
                      style: AppTypography.amount(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OrbitButton(
            label: l10n.debt_button_logPayment,
            onPressed: account.currentBalance > 0
                ? () => OrbitBottomSheet.show(
                      context: context,
                      title: l10n.debt_button_logPayment,
                      child: LogPaymentSheet(account: account),
                    )
                : null,
          ),
          const SizedBox(height: 16),
          SectionHeader(title: l10n.debt_label_paymentHistory),
          paymentsAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.electricBlue),
            ),
            error: (_, __) => Text(l10n.common_label_error),
            data: (payments) {
              if (payments.isEmpty) {
                return Text(l10n.common_label_empty,
                    style: AppTypography.labelSmall());
              }
              return Column(
                children: payments
                    .take(5)
                    .map((p) => _PaymentRow(payment: p))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  final PaymentLogModel payment;
  const _PaymentRow({required this.payment});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final memo = payment.memo.isEmpty ? l10n.expense_memo_empty : payment.memo;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(memo, style: AppTypography.bodyMedium()),
          Text(payment.amount.toKRW(),
              style: AppTypography.amount(fontSize: 13,
                  color: AppColors.neonGreen)),
        ],
      ),
    );
  }
}
