import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final bool isDangerous;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmLabel,
    this.isDangerous = false,
  });

  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmLabel,
    bool isDangerous = false,
  }) async =>
      await showDialog<bool>(
        context: context,
        builder: (_) => ConfirmDialog(
          title: title,
          message: message,
          confirmLabel: confirmLabel,
          isDangerous: isDangerous,
        ),
      ) ??
      false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      backgroundColor: AppColors.panelBg,
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.common_button_cancel),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isDangerous ? AppColors.alertRed : AppColors.electricBlue,
          ),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}
