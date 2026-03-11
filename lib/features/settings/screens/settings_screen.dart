import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/app/app.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:orbit_budget/core/services/preferences_service.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/core/utils/krw_input_formatter.dart';
import 'package:orbit_budget/features/settings/providers/settings_providers.dart';
import 'package:orbit_budget/features/settings/widgets/export_sheet.dart';
import 'package:orbit_budget/features/settings/widgets/reset_data_tile.dart';
import 'package:orbit_budget/shared/models/budget_setting_model.dart';
import 'package:orbit_budget/shared/widgets/orbit_bottom_sheet.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';
import 'package:orbit_budget/shared/widgets/orbit_text_field.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final budgetAsync = ref.watch(budgetSettingProvider);
    final currentLocale = ref.watch(localeProvider);
    final notifEnabled = ref.watch(notificationsEnabledProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings_title)),
      body: ListView(
        children: [
          // Monthly Budget
          ListTile(
            title: Text(l10n.settings_label_monthlyBudget,
                style: AppTypography.bodyMedium()),
            subtitle: Text(
              budgetAsync.value?.monthlyBudget.toString() ??
                  AppConstants.defaultMonthlyBudget.toString(),
              style: AppTypography.labelSmall(),
            ),
            trailing: const Icon(Icons.chevron_right,
                color: AppColors.mutedGray),
            onTap: () {
              final current =
                  budgetAsync.value ?? BudgetSettingModel.defaults();
              OrbitBottomSheet.show(
                context: context,
                title: l10n.settings_label_monthlyBudget,
                child: _BudgetEditSheet(current: current),
              );
            },
          ),
          const Divider(),
          // Language
          ListTile(
            title: Text(l10n.settings_label_language,
                style: AppTypography.bodyMedium()),
            subtitle: Text(
              currentLocale.languageCode == 'ko' ? '한국어' : 'English',
              style: AppTypography.labelSmall(),
            ),
            trailing: const Icon(Icons.chevron_right,
                color: AppColors.mutedGray),
            onTap: () => _showLanguageDialog(context, ref, l10n),
          ),
          const Divider(),
          // App version (package_info_plus)
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (ctx, snap) => ListTile(
              title: Text(l10n.settings_label_version,
                  style: AppTypography.bodyMedium()),
              trailing: Text(
                snap.hasData
                    ? l10n.settings_value_version(
                        '${snap.data!.version}+${snap.data!.buildNumber}')
                    : '…',
                style: AppTypography.labelSmall(),
              ),
            ),
          ),
          const Divider(),
          // Billing Reminders toggle
          SwitchListTile(
            title: Text(l10n.settings_label_notifications,
                style: AppTypography.bodyMedium()),
            subtitle: Text(l10n.settings_label_notifications_subtitle,
                style: AppTypography.labelSmall()),
            value: notifEnabled,
            activeThumbColor: AppColors.electricBlue,
            onChanged: (val) async {
              ref.read(notificationsEnabledProvider.notifier).state = val;
              await ref
                  .read(preferencesServiceProvider)
                  .setNotificationsEnabled(val);
            },
          ),
          const Divider(),
          // Export Data
          ListTile(
            title: Text(l10n.settings_label_exportData,
                style: AppTypography.bodyMedium()),
            subtitle: Text(l10n.settings_label_exportData_subtitle,
                style: AppTypography.labelSmall()),
            trailing: const Icon(Icons.download_outlined,
                color: AppColors.mutedGray),
            onTap: () => OrbitBottomSheet.show(
              context: context,
              title: l10n.settings_label_exportData,
              child: const ExportSheet(),
            ),
          ),
          const Divider(),
          // Privacy Policy
          ListTile(
            title: Text(l10n.settings_label_privacyPolicy,
                style: AppTypography.bodyMedium()),
            trailing: const Icon(Icons.chevron_right,
                color: AppColors.mutedGray),
            onTap: () => OrbitBottomSheet.show(
              context: context,
              title: l10n.settings_label_privacyPolicy,
              child: _PrivacyPolicyBody(l10n: l10n),
            ),
          ),
          const Divider(),
          // Reset All Data
          const ResetDataTile(),
        ],
      ),
    );
  }

  Future<void> _showLanguageDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.panelBg,
        title: Text(l10n.settings_label_language),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('한국어'),
              onTap: () async {
                await ref
                    .read(preferencesServiceProvider)
                    .setLocale('ko');
                ref.read(localeProvider.notifier).state =
                    const Locale('ko');
                if (ctx.mounted) Navigator.pop(ctx);
              },
            ),
            ListTile(
              title: const Text('English'),
              onTap: () async {
                await ref
                    .read(preferencesServiceProvider)
                    .setLocale('en');
                ref.read(localeProvider.notifier).state =
                    const Locale('en');
                if (ctx.mounted) Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacyPolicyBody extends StatelessWidget {
  final AppLocalizations l10n;
  const _PrivacyPolicyBody({required this.l10n});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Text(
          l10n.settings_label_privacyPolicy_body,
          style: AppTypography.bodyMedium(),
        ),
      );
}

class _BudgetEditSheet extends ConsumerStatefulWidget {
  final BudgetSettingModel current;
  const _BudgetEditSheet({required this.current});

  @override
  ConsumerState<_BudgetEditSheet> createState() => _BudgetEditSheetState();
}

class _BudgetEditSheetState extends ConsumerState<_BudgetEditSheet> {
  late final TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(
      text: widget.current.monthlyBudget.toString(),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrbitTextField(
          label: l10n.settings_label_monthlyBudget,
          controller: _ctrl,
          keyboardType: TextInputType.number,
          inputFormatters: [KRWInputFormatter()],
        ),
        const SizedBox(height: 20),
        OrbitButton(
          label: l10n.common_button_save,
          onPressed: () async {
            final amount = KRWInputFormatter.parse(_ctrl.text);
            if (amount <= 0) return;
            final nav = Navigator.of(context);
            await ref.read(budgetSettingNotifierProvider.notifier).save(
                  widget.current.copyWith(monthlyBudget: amount),
                );
            if (mounted) nav.pop();
          },
        ),
      ],
    );
  }
}
