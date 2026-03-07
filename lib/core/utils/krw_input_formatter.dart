import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class KRWInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return newValue.copyWith(text: '');
    final formatted =
        NumberFormat('#,##0', 'ko_KR').format(int.parse(digits));
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  static int parse(String formatted) =>
      int.tryParse(formatted.replaceAll(',', '')) ?? 0;
}
