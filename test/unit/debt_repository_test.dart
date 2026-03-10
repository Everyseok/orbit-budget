import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';
import 'fakes.dart';

void main() {
  group('FakeDebtRepository', () {
    late FakeDebtRepository repo;
    setUp(() => repo = FakeDebtRepository());

    test('seed creates 2 accounts', () async {
      await repo.seed();
      expect((await repo.watchAll().first).length, equals(2));
    });

    test('seed is idempotent', () async {
      await repo.seed();
      await repo.seed();
      expect((await repo.watchAll().first).length, equals(2));
    });

    test('logPayment reduces currentBalance', () async {
      await repo.seed();
      final id = (await repo.watchAll().first).first.id;
      await repo.logPayment(PaymentLogModel(
        id: 0,
        debtAccountId: id,
        amount: 100000,
        date: DateTime.now(),
        memo: '',
      ));
      final updated =
          (await repo.watchAll().first).firstWhere((a) => a.id == id);
      expect(updated.currentBalance, equals(2900000));
    });

    test('logPayment cannot reduce balance below 0', () async {
      await repo.seed();
      final id = (await repo.watchAll().first).first.id;
      await repo.logPayment(PaymentLogModel(
        id: 0,
        debtAccountId: id,
        amount: 99999999,
        date: DateTime.now(),
        memo: '',
      ));
      final updated =
          (await repo.watchAll().first).firstWhere((a) => a.id == id);
      expect(updated.currentBalance, equals(0));
    });

    test('watchPayments returns payments for correct account only', () async {
      await repo.seed();
      final accounts = await repo.watchAll().first;
      final id1 = accounts[0].id;
      final id2 = accounts[1].id;
      await repo.logPayment(PaymentLogModel(
          id: 0,
          debtAccountId: id1,
          amount: 50000,
          date: DateTime.now(),
          memo: ''));
      final p1 = await repo.watchPayments(id1).first;
      final p2 = await repo.watchPayments(id2).first;
      expect(p1.length, equals(1));
      expect(p2.length, equals(0));
    });
  });
}
