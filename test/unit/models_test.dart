import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/extensions/datetime_ext.dart';
import 'package:orbit_budget/core/extensions/int_ext.dart';
import 'package:orbit_budget/core/utils/krw_input_formatter.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';

void main() {
  group('ExpenseModel', () {
    final base = ExpenseModel(
      id: 1,
      date: DateTime(2024, 3, 7, 12, 0),
      amount: 15000,
      category: CategoryType.food,
      memo: '점심',
    );

    test('toJson / fromJson round-trip', () {
      final back = ExpenseModel.fromJson(base.toJson());
      expect(back.id, equals(base.id));
      expect(back.amount, equals(base.amount));
      expect(back.category, equals(base.category));
      expect(back.memo, equals(base.memo));
    });

    test('copyWith changes only specified field', () {
      final copy = base.copyWith(amount: 9900);
      expect(copy.amount, equals(9900));
      expect(copy.category, equals(base.category));
      expect(copy.id, equals(base.id));
    });
  });

  group('KRW int extension', () {
    test('3000000 → ₩3,000,000', () =>
        expect(3000000.toKRW(), equals('₩3,000,000')));
    test('0 → ₩0', () => expect(0.toKRW(), equals('₩0')));
    test('toKRWNoSymbol has no ₩', () =>
        expect(500000.toKRWNoSymbol().contains('₩'), isFalse));
  });

  group('KRWInputFormatter', () {
    test('parse "1,234,567" → 1234567', () =>
        expect(KRWInputFormatter.parse('1,234,567'), equals(1234567)));
    test('parse "" → 0', () =>
        expect(KRWInputFormatter.parse(''), equals(0)));
  });

  group('DateTime extensions', () {
    test('isSameDay true', () => expect(
        DateTime(2024, 3, 7, 0, 0).isSameDay(DateTime(2024, 3, 7, 23, 59)),
        isTrue));
    test('isSameDay false', () => expect(
        DateTime(2024, 3, 7).isSameDay(DateTime(2024, 3, 8)), isFalse));
    test('toBillingDisplay → MM.dd', () =>
        expect(DateTime(2024, 3, 7).toBillingDisplay(), equals('03.07')));
  });

  group('DebtAccountModel.progressRatio', () {
    DebtAccountModel make(int start, int current) => DebtAccountModel(
          id: 1,
          label: '',
          type: DebtAccountType.loan,
          startingBalance: start,
          currentBalance: current,
          createdAt: DateTime.now(),
        );
    test('50% repaid → 0.5', () =>
        expect(make(1000000, 500000).progressRatio, closeTo(0.5, 0.001)));
    test('fully repaid → 1.0', () =>
        expect(make(1000000, 0).progressRatio, equals(1.0)));
    test('startingBalance 0 → 0.0 (no divide-by-zero)', () =>
        expect(make(0, 0).progressRatio, equals(0.0)));
  });
}
