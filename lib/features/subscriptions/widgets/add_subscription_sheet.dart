import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/core/utils/krw_input_formatter.dart';
import 'package:orbit_budget/features/subscriptions/providers/subscription_providers.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';
import 'package:orbit_budget/shared/widgets/orbit_text_field.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class AddSubscriptionSheet extends ConsumerStatefulWidget {
  const AddSubscriptionSheet({super.key});

  @override
  ConsumerState<AddSubscriptionSheet> createState() =>
      _AddSubscriptionSheetState();
}

class _AddSubscriptionSheetState extends ConsumerState<AddSubscriptionSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _costCtrl = TextEditingController();
  final _urlCtrl = TextEditingController();
  int _billingDay = 1;
  String _emoji = '💳';

  static const _emojis = [
    '💳', '🎬', '▶️', '🎵', '🤖', '🪐',
    '📦', '🟢', '🍿', '📺', '🌊', '📚',
  ];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _costCtrl.dispose();
    _urlCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final now = DateTime.now();
    final model = SubscriptionModel(
      id: 0,
      name: _nameCtrl.text.trim(),
      monthlyCost: KRWInputFormatter.parse(_costCtrl.text),
      billingDay: _billingDay,
      status: SubscriptionStatus.active,
      manageUrl: _urlCtrl.text.trim(),
      logoEmoji: _emoji,
      nextBillingDate: now,
      createdAt: now,
    );
    await ref.read(subscriptionFormProvider.notifier).add(model);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrbitTextField(
              label: l10n.nav_subscriptions,
              controller: _nameCtrl,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.common_label_error : null,
            ),
            const SizedBox(height: 12),
            OrbitTextField(
              label: l10n.expense_label_amount,
              controller: _costCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [KRWInputFormatter()],
              validator: (v) =>
                  KRWInputFormatter.parse(v ?? '') <= 0 ? l10n.common_label_error : null,
            ),
            const SizedBox(height: 12),
            Text(l10n.subscription_label_nextBilling,
                style: AppTypography.labelSmall()),
            const SizedBox(height: 4),
            DropdownButton<int>(
              value: _billingDay,
              dropdownColor: AppColors.panelBg,
              style: AppTypography.bodyMedium(),
              isExpanded: true,
              items: List.generate(
                28,
                (i) => DropdownMenuItem(
                  value: i + 1,
                  child: Text('${i + 1}'),
                ),
              ),
              onChanged: (v) => setState(() => _billingDay = v ?? 1),
            ),
            const SizedBox(height: 12),
            OrbitTextField(
              label: l10n.subscription_button_manage,
              controller: _urlCtrl,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _emojis.map((e) {
                return TextButton(
                  onPressed: () => setState(() => _emoji = e),
                  style: TextButton.styleFrom(
                    backgroundColor: e == _emoji
                        ? AppColors.blueSubtle
                        : Colors.transparent,
                    minimumSize: const Size(44, 44),
                  ),
                  child: Text(e, style: const TextStyle(fontSize: 20)),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            OrbitButton(
              label: l10n.common_button_save,
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }
}
