import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/features/expenses/providers/expense_providers.dart';
import 'fakes.dart';

void main() {
  group('ExpenseFormNotifier', () {
    test('add transitions state to data(null) on success', () async {
      final repo = FakeExpenseRepository();
      final notifier = ExpenseFormNotifier(repo);
      await notifier.add(
        amount: 5000,
        category: CategoryType.food,
        memo: '커피',
        date: DateTime.now(),
      );
      expect(notifier.state, isA<AsyncData<void>>());
      final list = await repo.watchAll().first;
      expect(list.length, equals(1));
      expect(list.first.amount, equals(5000));
    });

    test('delete removes expense', () async {
      final repo = FakeExpenseRepository();
      final notifier = ExpenseFormNotifier(repo);
      await notifier.add(
        amount: 3000,
        category: CategoryType.transport,
        memo: '',
        date: DateTime.now(),
      );
      final id = (await repo.watchAll().first).first.id;
      await notifier.delete(id);
      expect(await repo.watchAll().first, isEmpty);
    });
  });
}
