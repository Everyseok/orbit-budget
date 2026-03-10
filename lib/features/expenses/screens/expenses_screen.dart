import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/extensions/datetime_ext.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/features/expenses/widgets/add_expense_sheet.dart';
import 'package:orbit_budget/features/expenses/widgets/expense_list_item.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_bottom_sheet.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final expensesAsync = ref.watch(expenseListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.expense_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => OrbitBottomSheet.show(
              context: context,
              title: l10n.expense_button_add,
              child: const AddExpenseSheet(),
            ),
          ),
        ],
      ),
      body: expensesAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.electricBlue),
        ),
        error: (_, __) => Center(child: Text(l10n.common_label_error)),
        data: (expenses) {
          if (expenses.isEmpty) {
            return EmptyStateWidget(
              message: l10n.common_label_empty,
              icon: Icons.add_circle_outline,
            );
          }
          final today = DateTime.now();
          final yesterday = today.subtract(const Duration(days: 1));
          final Map<String, List<ExpenseModel>> grouped = {};
          for (final e in expenses) {
            final key = e.date.isSameDay(today)
                ? l10n.expense_label_today
                : e.date.isSameDay(yesterday)
                    ? l10n.expense_label_yesterday
                    : e.date.toKoreanDate();
            grouped.putIfAbsent(key, () => []).add(e);
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: grouped.entries.map((entry) {
              final dayTotal = entry.value
                  .fold(0, (s, e) => s + e.amount);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(entry.key, style: AppTypography.sectionLabel()),
                        Text(dayTotal.toKRW(),
                            style: AppTypography.labelSmall()),
                      ],
                    ),
                  ),
                  ...entry.value.map((e) => ExpenseListItem(expense: e)),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
