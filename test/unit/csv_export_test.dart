import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';

/// Unit tests for CSV format logic.
/// The actual [CsvExportService.exportExpenses] / [exportSubscriptions]
/// methods call path_provider + share_plus (platform channels) and cannot
/// be exercised in plain unit tests. These tests instead validate that the
/// model data is structured as the CSV service expects.
void main() {
  group('ExpenseModel — CSV field expectations', () {
    final expense = ExpenseModel(
      id: 1,
      date: DateTime(2024, 3, 7),
      amount: 15000,
      category: CategoryType.food,
      memo: 'lunch, takeout',
    );

    test('date is ISO8601 substring to length 10', () {
      expect(
          expense.date.toIso8601String().substring(0, 10), equals('2024-03-07'));
    });

    test('amount is an int (no decimal)', () {
      expect(expense.amount.toString(), equals('15000'));
    });

    test('category.name is a plain string (no spaces)', () {
      expect(expense.category.name.contains(' '), isFalse);
    });
  });

  group('CSV escape logic (inline)', () {
    // Replicates CsvExportService._escape locally for testability.
    String escape(String v) {
      if (v.contains(',') || v.contains('"') || v.contains('\n')) {
        return '"${v.replaceAll('"', '""')}"';
      }
      return v;
    }

    test('plain string — unchanged', () {
      expect(escape('hello'), equals('hello'));
    });

    test('string with comma — quoted', () {
      expect(escape('a,b'), equals('"a,b"'));
    });

    test('string with double-quote — escaped inside quotes', () {
      expect(escape('say "hi"'), equals('"say ""hi"""'));
    });

    test('string with newline — quoted', () {
      expect(escape('line1\nline2'), equals('"line1\nline2"'));
    });

    test('empty string — unchanged', () {
      expect(escape(''), equals(''));
    });
  });

  group('SubscriptionModel — CSV field expectations', () {
    final sub = SubscriptionModel(
      id: 1,
      name: 'Netflix',
      monthlyCost: 17000,
      billingDay: 1,
      status: SubscriptionStatus.active,
      manageUrl: '',
      logoEmoji: '🎬',
      nextBillingDate: DateTime(2024, 4, 1),
      createdAt: DateTime.now(),
    );

    test('monthlyCost is int', () {
      expect(sub.monthlyCost.toString(), equals('17000'));
    });

    test('status.name is a plain string', () {
      expect(sub.status.name, equals('active'));
    });

    test('nextBillingDate formats to 10-char date string', () {
      expect(sub.nextBillingDate.toIso8601String().substring(0, 10),
          equals('2024-04-01'));
    });
  });
}
