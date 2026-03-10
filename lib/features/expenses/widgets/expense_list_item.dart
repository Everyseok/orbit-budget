import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orbit_budget/core/extensions/datetime_ext.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/widgets/confirm_dialog.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class ExpenseListItem extends ConsumerWidget {
  final ExpenseModel expense;
  const ExpenseListItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final memoText =
        expense.memo.isEmpty ? l10n.expense_memo_empty : expense.memo;

    return Slidable(
      key: ValueKey(expense.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) async {
              final confirmed = await ConfirmDialog.show(
                context: context,
                title: l10n.expense_action_delete,
                message: l10n.subscription_confirm_delete(memoText),
                confirmLabel: l10n.common_button_delete,
                isDangerous: true,
              );
              if (confirmed) {
                await ref
                    .read(expenseFormProvider.notifier)
                    .delete(expense.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.expense_action_delete)),
                  );
                }
              }
            },
            backgroundColor: AppColors.alertRed,
            foregroundColor: AppColors.white,
            icon: Icons.delete_outline,
            label: l10n.expense_action_delete,
          ),
        ],
      ),
      child: ListTile(
        leading: Text(expense.category.emoji,
            style: const TextStyle(fontSize: 22)),
        title: Text(memoText, style: AppTypography.bodyMedium()),
        subtitle: Text(expense.date.toBillingDisplay(),
            style: AppTypography.labelSmall()),
        trailing: Text(expense.amount.toKRW(),
            style: AppTypography.amount(fontSize: 14)),
        dense: true,
      ),
    );
  }
}
