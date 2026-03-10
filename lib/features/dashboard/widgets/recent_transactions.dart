import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orbit_budget/core/constants/routes.dart';
import 'package:orbit_budget/core/extensions/datetime_ext.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_card.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class RecentTransactions extends ConsumerWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final expensesAsync = ref.watch(expenseListProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.dashboard_label_recentTransactions),
        const SizedBox(height: 8),
        expensesAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.electricBlue),
          ),
          error: (_, __) => Text(l10n.common_label_error),
          data: (list) {
            final recent = list.take(5).toList();
            if (recent.isEmpty) {
              return EmptyStateWidget(message: l10n.common_label_empty);
            }
            return OrbitCard(
              child: Column(
                children: recent.map((e) {
                  final memoText =
                      e.memo.isEmpty ? l10n.expense_memo_empty : e.memo;
                  return ListTile(
                    onTap: () => context.go(Routes.expenses),
                    leading: Text(e.category.emoji,
                        style: const TextStyle(fontSize: 20)),
                    title: Text(memoText, style: AppTypography.bodyMedium()),
                    subtitle: Text(e.date.toKoreanShortDate(),
                        style: AppTypography.labelSmall()),
                    trailing: Text(e.amount.toKRW(),
                        style: AppTypography.amount(fontSize: 14)),
                    dense: true,
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
