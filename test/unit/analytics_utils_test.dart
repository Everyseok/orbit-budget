import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/utils/analytics_utils.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

void main() {
  group('AnalyticsUtils.categoryTotals', () {
    test('sums correctly by category', () {
      final expenses = [
        _expense(CategoryType.food, 10000),
        _expense(CategoryType.food, 5000),
        _expense(CategoryType.transport, 3000),
      ];
      final totals = AnalyticsUtils.categoryTotals(expenses);
      expect(totals[CategoryType.food], equals(15000));
      expect(totals[CategoryType.transport], equals(3000));
      expect(totals[CategoryType.health], isNull);
    });

    test('empty list returns empty map', () {
      expect(AnalyticsUtils.categoryTotals([]), isEmpty);
    });
  });

  group('AnalyticsUtils.dailyTotals', () {
    test('returns [days] entries', () {
      final ref = DateTime(2024, 6, 15);
      final result = AnalyticsUtils.dailyTotals([], ref, days: 30);
      expect(result.length, equals(30));
    });

    test('sums expenses on the correct day', () {
      final ref = DateTime(2024, 6, 15);
      final today = ref;
      final expenses = [
        _expenseOnDate(today, 12000),
        _expenseOnDate(today, 8000),
        _expenseOnDate(today.subtract(const Duration(days: 1)), 5000),
      ];
      final totals = AnalyticsUtils.dailyTotals(expenses, ref);
      final todayEntry = totals.last;
      expect(todayEntry.total, equals(20000));
      expect(totals[totals.length - 2].total, equals(5000));
    });

    test('days with no expenses have total 0', () {
      final ref = DateTime(2024, 6, 15);
      final totals = AnalyticsUtils.dailyTotals([], ref);
      expect(totals.every((d) => d.total == 0), isTrue);
    });
  });

  group('AnalyticsUtils.monthlyTotals', () {
    test('returns [months] entries', () {
      final ref = DateTime(2024, 6, 1);
      final result = AnalyticsUtils.monthlyTotals([], ref, months: 6);
      expect(result.length, equals(6));
    });

    test('last entry is reference month', () {
      final ref = DateTime(2024, 6, 1);
      final result = AnalyticsUtils.monthlyTotals([], ref);
      expect(result.last.month, equals(6));
      expect(result.last.year, equals(2024));
    });

    test('sums expenses into correct month', () {
      final ref = DateTime(2024, 6, 1);
      final expenses = [
        _expenseOnDate(DateTime(2024, 5, 10), 10000),
        _expenseOnDate(DateTime(2024, 6, 1), 20000),
      ];
      final result = AnalyticsUtils.monthlyTotals(expenses, ref);
      final may = result.firstWhere((m) => m.month == 5);
      final june = result.firstWhere((m) => m.month == 6);
      expect(may.total, equals(10000));
      expect(june.total, equals(20000));
    });
  });

  group('AnalyticsUtils.debtProjection', () {
    test('returns null when no debt', () {
      expect(AnalyticsUtils.debtProjection([], []), isNull);
    });

    test('returns null when no recent payments', () {
      final account = _account(500000);
      expect(AnalyticsUtils.debtProjection([account], []), isNull);
    });

    test('calculates months remaining correctly', () {
      final account = _account(300000);
      // 3 recent payments of 100000 each → avg = 100000/month
      final payments = [
        _payment(account.id, 100000, DateTime.now().subtract(const Duration(days: 30))),
        _payment(account.id, 100000, DateTime.now().subtract(const Duration(days: 60))),
        _payment(account.id, 100000, DateTime.now().subtract(const Duration(days: 90))),
      ];
      // avgMonthly = 300000 ~/ 3 = 100000, months = ceil(300000/100000) = 3
      final projection = AnalyticsUtils.debtProjection([account], payments);
      expect(projection, isNotNull);
      expect(projection!.estimatedMonthsRemaining, equals(3));
      expect(projection.avgMonthlyPayment, equals(100000));
    });
  });
}

ExpenseModel _expense(CategoryType cat, int amount) => ExpenseModel(
      id: 0,
      date: DateTime.now(),
      amount: amount,
      category: cat,
      memo: '',
    );

ExpenseModel _expenseOnDate(DateTime date, int amount) => ExpenseModel(
      id: 0,
      date: date,
      amount: amount,
      category: CategoryType.other,
      memo: '',
    );

DebtAccountModel _account(int balance) => DebtAccountModel(
      id: 1,
      label: 'Test',
      type: DebtAccountType.loan,
      startingBalance: balance,
      currentBalance: balance,
      createdAt: DateTime.now(),
    );

PaymentLogModel _payment(int accountId, int amount, DateTime date) =>
    PaymentLogModel(
      id: 0,
      debtAccountId: accountId,
      amount: amount,
      date: date,
    );
