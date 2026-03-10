import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';
import 'package:orbit_budget/core/utils/krw_input_formatter.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';
import 'package:orbit_budget/shared/widgets/orbit_text_field.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class AddExpenseSheet extends ConsumerStatefulWidget {
  const AddExpenseSheet({super.key});

  @override
  ConsumerState<AddExpenseSheet> createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends ConsumerState<AddExpenseSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _memoCtrl = TextEditingController();
  CategoryType _category = CategoryType.other;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _memoCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(expenseFormProvider.notifier).add(
          amount: KRWInputFormatter.parse(_amountCtrl.text),
          category: _category,
          memo: _memoCtrl.text.trim(),
          date: DateTime.now(),
        );
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
              label: l10n.expense_label_amount,
              controller: _amountCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [KRWInputFormatter()],
              validator: (v) =>
                  KRWInputFormatter.parse(v ?? '') <= 0
                      ? l10n.common_label_error
                      : null,
            ),
            const SizedBox(height: 12),
            Text(l10n.expense_label_category, style: AppTypography.labelSmall()),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: CategoryType.values.map((c) {
                final selected = c == _category;
                return ChoiceChip(
                  label: Text('${c.emoji} '),
                  selected: selected,
                  onSelected: (_) => setState(() => _category = c),
                  selectedColor: AppColors.blueSubtle,
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            OrbitTextField(
              label: l10n.expense_hint_memo,
              controller: _memoCtrl,
              maxLines: 2,
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
