import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/features/dashboard/widgets/budget_fuel_gauge.dart';
import 'package:orbit_budget/features/dashboard/widgets/debt_overview_panel.dart';
import 'package:orbit_budget/features/dashboard/widgets/recent_transactions.dart';
import 'package:orbit_budget/features/dashboard/widgets/today_sub_row.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.nav_dashboard)),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DebtOverviewPanel(),
            SizedBox(height: 16),
            BudgetFuelGauge(),
            SizedBox(height: 16),
            TodaySubRow(),
            SizedBox(height: 16),
            RecentTransactions(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
