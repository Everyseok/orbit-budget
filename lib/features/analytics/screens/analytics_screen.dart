import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/features/analytics/providers/analytics_providers.dart';
import 'package:orbit_budget/features/analytics/widgets/analytics_summary_card.dart';
import 'package:orbit_budget/features/analytics/widgets/category_pie_chart.dart';
import 'package:orbit_budget/features/analytics/widgets/debt_projection_card.dart';
import 'package:orbit_budget/features/analytics/widgets/monthly_bar_chart.dart';
import 'package:orbit_budget/features/analytics/widgets/presets_sheet.dart';
import 'package:orbit_budget/features/analytics/widgets/sample_data_fab.dart';
import 'package:orbit_budget/features/analytics/widgets/save_preset_sheet.dart';
import 'package:orbit_budget/features/analytics/widgets/spending_line_chart.dart';
import 'package:orbit_budget/features/analytics/widgets/sub_vs_variable_card.dart';
import 'package:orbit_budget/features/analytics/widgets/subscription_cost_ranking.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/orbit_bottom_sheet.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final snapshot = ref.watch(analyticsSnapshotProvider);

    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        title: Text(l10n.analytics_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks_outlined),
            tooltip: l10n.analytics_action_loadPreset,
            onPressed: () => OrbitBottomSheet.show(
              context: context,
              title: l10n.analytics_action_loadPreset,
              child: const PresetsSheet(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_add_outlined),
            tooltip: l10n.analytics_action_savePreset,
            onPressed: () => OrbitBottomSheet.show(
              context: context,
              title: l10n.analytics_action_savePreset,
              child: const SavePresetSheet(),
            ),
          ),
        ],
      ),
      body: snapshot.when(
        loading: () => const Center(
              child: CircularProgressIndicator(
                  color: AppColors.electricBlue)),
        error: (e, _) => EmptyStateWidget(message: e.toString()),
        data: (data) => data.hasData
            ? _AnalyticsBody(data: data)
            : EmptyStateWidget(message: l10n.analytics_label_noData),
      ),
      floatingActionButton:
          kDebugMode ? const SampleDataFab() : null,
    );
  }
}

class _AnalyticsBody extends StatelessWidget {
  final AnalyticsSnapshot data;
  const _AnalyticsBody({required this.data});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnalyticsSummaryCard(data: data),
            const SizedBox(height: 16),
            CategoryPieChart(categoryTotals: data.categoryTotals),
            const SizedBox(height: 16),
            SpendingLineChart(dailyTotals: data.dailyTotals),
            const SizedBox(height: 16),
            SubVsVariableCard(
              subTotal: data.subscriptionMonthlyTotal,
              variableTotal: data.variableMonthlyTotal,
            ),
            const SizedBox(height: 16),
            MonthlyBarChart(monthlyTotals: data.monthlyTotals),
            const SizedBox(height: 16),
            if (data.debtProjection != null)
              DebtProjectionCard(projection: data.debtProjection!),
            const SizedBox(height: 16),
            const SubscriptionCostRankingWidget(),
          ],
        ),
      );
}
