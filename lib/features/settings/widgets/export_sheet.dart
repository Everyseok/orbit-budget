import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/providers/analytics_providers.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class ExportSheet extends ConsumerWidget {
  const ExportSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final exportState = ref.watch(exportProvider);
    final isLoading = exportState.isLoading;

    ref.listen<AsyncValue<void>>(exportProvider, (_, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.export_error,
                style: AppTypography.labelSmall()),
            backgroundColor: AppColors.alertRed,
          ),
        );
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.settings_label_exportData,
            style: AppTypography.headlineMedium()),
        const SizedBox(height: 8),
        Text(l10n.settings_label_exportData_subtitle,
            style: AppTypography.labelSmall()),
        const SizedBox(height: 24),
        OrbitButton(
          label: '${l10n.export_label_expenses} CSV',
          isLoading: isLoading,
          onPressed: () => ref.read(exportProvider.notifier).exportExpenses(),
        ),
        const SizedBox(height: 12),
        OrbitButton(
          label: '${l10n.export_label_subscriptions} CSV',
          isLoading: isLoading,
          onPressed: () => ref.read(exportProvider.notifier).exportSubscriptions(),
        ),
      ],
    );
  }
}
