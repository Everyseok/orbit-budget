import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.expense_title)),
      body: EmptyStateWidget(
        message: l10n.placeholder_stage2,
        icon: Icons.add_circle_outline,
      ),
    );
  }
}
