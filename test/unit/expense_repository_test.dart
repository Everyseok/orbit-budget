import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'fakes.dart';

void main() {
  group('FakeExpenseRepository', () {
    late FakeExpenseRepository repo;
    final march7 = DateTime(2024, 3, 7);

    ExpenseModel lunch() => ExpenseModel(
          id: 0,
          date: march7,
          amount: 12000,
          category: CategoryType.food,
          memo: '점심',
        );

    setUp(() => repo = FakeExpenseRepository());

    test('add stores expense with assigned id', () async {
      await repo.add(lunch());
      final list = await repo.watchAll().first;
      expect(list.length, equals(1));
      expect(list.first.id, greaterThan(0));
      expect(list.first.amount, equals(12000));
    });

    test('delete removes by id', () async {
      await repo.add(lunch());
      final id = (await repo.watchAll().first).first.id;
      await repo.delete(id);
      expect(await repo.watchAll().first, isEmpty);
    });

    test('watchByMonth filters correctly', () async {
      await repo.add(lunch()); // March 2024
      await repo.add(lunch().copyWith(id: 0, date: DateTime(2024, 4, 1)));
      final march = await repo.watchByMonth(2024, 3).first;
      expect(march.length, equals(1));
      expect(march.first.date.month, equals(3));
    });

    test('getByDateRange returns inclusive bounds', () async {
      await repo.add(lunch());
      final result = await repo.getByDateRange(
          DateTime(2024, 3, 1), DateTime(2024, 3, 31));
      expect(result.length, equals(1));
    });
  });
}
