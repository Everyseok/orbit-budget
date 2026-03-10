import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/features/debt/providers/debt_providers.dart';
import 'package:orbit_budget/features/debt/widgets/debt_account_card.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/glow_text.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DebtScreen extends ConsumerWidget {
  const DebtScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final accountsAsync = ref.watch(debtAccountsProvider);
    final total = ref.watch(totalDebtProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.debt_title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: l10n.debt_label_combinedTotal),
            GlowText(total.toKRW(), fontSize: 32),
            const SizedBox(height: 24),
            Expanded(
              child: accountsAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.electricBlue),
                ),
                error: (_, __) =>
                    Center(child: Text(l10n.common_label_error)),
                data: (accounts) {
                  if (accounts.isEmpty) {
                    return EmptyStateWidget(
                        message: l10n.common_label_empty);
                  }
                  return ListView.separated(
                    itemCount: accounts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (_, i) =>
                        DebtAccountCard(account: accounts[i]),
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
