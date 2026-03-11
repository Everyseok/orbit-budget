import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/features/settings/providers/settings_providers.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class ResetDataTile extends ConsumerWidget {
  const ResetDataTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    ref.listen<AsyncValue<void>>(resetDataProvider, (_, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString(),
                style: AppTypography.labelSmall()),
            backgroundColor: AppColors.alertRed,
          ),
        );
      }
    });

    return ListTile(
      title: Text(l10n.settings_label_resetData,
          style: AppTypography.bodyMedium()
              .copyWith(color: AppColors.alertRed)),
      subtitle: Text(l10n.settings_label_resetData_subtitle,
          style: AppTypography.labelSmall()),
      trailing: const Icon(Icons.delete_forever, color: AppColors.alertRed),
      onTap: () => _confirmReset(context, ref, l10n),
    );
  }

  Future<void> _confirmReset(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.panelBg,
        title: Text(l10n.settings_label_resetData),
        content: Text(l10n.settings_confirm_resetData),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.common_button_cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l10n.settings_confirm_resetData_button,
              style: const TextStyle(color: AppColors.alertRed),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    if (!context.mounted) return;
    await ref.read(resetDataProvider.notifier).reset();
  }
}
