import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/utils/krw_input_formatter.dart';
import 'package:orbit_budget/features/debt/providers/debt_providers.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/widgets/orbit_button.dart';
import 'package:orbit_budget/shared/widgets/orbit_text_field.dart';
import 'package:orbit_budget/src/l10n/app_localizations.dart';

class LogPaymentSheet extends ConsumerStatefulWidget {
  final DebtAccountModel account;
  const LogPaymentSheet({super.key, required this.account});

  @override
  ConsumerState<LogPaymentSheet> createState() => _LogPaymentSheetState();
}

class _LogPaymentSheetState extends ConsumerState<LogPaymentSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _memoCtrl = TextEditingController();

  @override
  void dispose() {
    _amountCtrl.dispose();
    _memoCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(debtPaymentProvider.notifier).logPayment(
          debtAccountId: widget.account.id,
          amount: KRWInputFormatter.parse(_amountCtrl.text),
          date: DateTime.now(),
          memo: _memoCtrl.text.trim(),
        );
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrbitTextField(
            label: l10n.expense_label_amount,
            controller: _amountCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [KRWInputFormatter()],
            validator: (v) {
              final amount = KRWInputFormatter.parse(v ?? '');
              if (amount <= 0) return l10n.common_label_error;
              if (amount > widget.account.currentBalance) {
                return l10n.common_label_error;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          OrbitTextField(
            label: l10n.expense_hint_memo,
            controller: _memoCtrl,
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          OrbitButton(
            label: l10n.debt_button_logPayment,
            onPressed: _save,
          ),
        ],
      ),
    );
  }
}
