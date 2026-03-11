import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/analytics/providers/analytics_providers.dart';
import 'package:orbit_budget/shared/widgets/confirm_dialog.dart';
import 'package:orbit_budget/shared/widgets/empty_state_widget.dart';
import 'package:orbit_budget/shared/widgets/section_header.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class PresetsSheet extends ConsumerWidget {
  const PresetsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final presets = ref.watch(graphPresetListProvider);
    final notifier = ref.read(graphPresetNotifierProvider.notifier);

    return presets.when(
      loading: () => const Center(
            child: CircularProgressIndicator(
                color: AppColors.electricBlue)),
      error: (e, _) => Text(l10n.common_label_error),
      data: (list) => list.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: EmptyStateWidget(
                  message: l10n.analytics_label_noPresets))
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                    title: l10n.analytics_action_loadPreset),
                ...list.map((p) => ListTile(
                      title: Text(p.name,
                          style: AppTypography.bodyMedium()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: AppColors.alertRed),
                        onPressed: () async {
                          final ok = await ConfirmDialog.show(
                            context: context,
                            title: l10n.analytics_action_deletePreset,
                            message: l10n
                                .analytics_confirm_deletePreset(p.name),
                            confirmLabel: l10n.common_button_delete,
                            isDangerous: true,
                          );
                          if (ok) await notifier.delete(p.id);
                        },
                      ),
                      onTap: () {
                        ref
                            .read(selectedPresetProvider.notifier)
                            .state = p;
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
    );
  }
}
