import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/features/analytics/providers/analytics_providers.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class SampleDataFab extends ConsumerWidget {
  const SampleDataFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return FloatingActionButton.extended(
      onPressed: () async {
        await ref.read(sampleDataProvider.notifier).seed();
        ref.invalidate(analyticsSnapshotProvider);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(l10n.analytics_label_sampleDataButton)),
          );
        }
      },
      label: Text(l10n.analytics_label_sampleDataButton),
      icon: const Icon(Icons.science_outlined),
      backgroundColor: AppColors.panelBg,
    );
  }
}
