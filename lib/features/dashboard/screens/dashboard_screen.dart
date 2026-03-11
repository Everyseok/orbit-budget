import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/services/notification_service.dart';
import 'package:orbit_budget/core/services/preferences_service.dart';
import 'package:orbit_budget/features/dashboard/widgets/budget_fuel_gauge.dart';
import 'package:orbit_budget/features/dashboard/widgets/debt_overview_panel.dart';
import 'package:orbit_budget/features/dashboard/widgets/recent_transactions.dart';
import 'package:orbit_budget/features/dashboard/widgets/today_sub_row.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeRequestPermission());
  }

  Future<void> _maybeRequestPermission() async {
    final prefs = ref.read(preferencesServiceProvider);
    if (prefs.notificationPermissionRequested) return;
    await ref.read(notificationServiceProvider).requestPermission();
    await prefs.setNotificationPermissionRequested(true);
  }

  @override
  Widget build(BuildContext context) {
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
