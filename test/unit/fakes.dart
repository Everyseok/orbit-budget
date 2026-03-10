import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/features/debt/repositories/debt_repository.dart';
import 'package:orbit_budget/features/expenses/repositories/expense_repository.dart';
import 'package:orbit_budget/features/subscriptions/repositories/subscription_repository.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';

class FakeExpenseRepository implements ExpenseRepository {
  final List<ExpenseModel> _store = [];
  int _nextId = 1;

  @override
  Stream<List<ExpenseModel>> watchAll() =>
      Stream.value(List.unmodifiable(_store));

  @override
  Stream<List<ExpenseModel>> watchByMonth(int y, int m) =>
      Stream.value(_store
          .where((e) => e.date.year == y && e.date.month == m)
          .toList());

  @override
  Future<void> add(ExpenseModel model) async =>
      _store.add(model.copyWith(id: _nextId++));

  @override
  Future<void> update(ExpenseModel model) async {
    final i = _store.indexWhere((e) => e.id == model.id);
    if (i >= 0) _store[i] = model;
  }

  @override
  Future<void> delete(int id) async =>
      _store.removeWhere((e) => e.id == id);

  @override
  Future<List<ExpenseModel>> getByDateRange(
      DateTime start, DateTime end) async =>
      _store
          .where((e) => !e.date.isBefore(start) && !e.date.isAfter(end))
          .toList();
}

class FakeSubscriptionRepository implements SubscriptionRepository {
  final List<SubscriptionModel> _store = [];
  int _nextId = 1;

  @override
  Future<void> seed() async {
    if (_store.isNotEmpty) return;
    _store.add(SubscriptionModel(
      id: _nextId++,
      name: 'Netflix',
      monthlyCost: 17000,
      billingDay: 1,
      status: SubscriptionStatus.active,
      manageUrl: 'https://netflix.com',
      logoEmoji: '🎬',
      nextBillingDate: DateTime.now().add(const Duration(days: 15)),
      createdAt: DateTime.now(),
    ));
  }

  @override
  Stream<List<SubscriptionModel>> watchAll() =>
      Stream.value(List.unmodifiable(_store));

  @override
  Future<void> add(SubscriptionModel item) async =>
      _store.add(item.copyWith(id: _nextId++));

  @override
  Future<void> update(SubscriptionModel item) async {
    final i = _store.indexWhere((s) => s.id == item.id);
    if (i >= 0) _store[i] = item;
  }

  @override
  Future<void> delete(int id) async =>
      _store.removeWhere((s) => s.id == id);
}

class FakeDebtRepository implements DebtRepository {
  final List<DebtAccountModel> _accounts = [];
  final List<PaymentLogModel> _payments = [];
  int _nextAccountId = 1;
  int _nextPaymentId = 1;

  @override
  Future<void> seed() async {
    if (_accounts.isNotEmpty) return;
    _accounts.addAll([
      DebtAccountModel(
        id: _nextAccountId++,
        label: '',
        type: DebtAccountType.loan,
        startingBalance: 3000000,
        currentBalance: 3000000,
        createdAt: DateTime.now(),
      ),
      DebtAccountModel(
        id: _nextAccountId++,
        label: '',
        type: DebtAccountType.credit,
        startingBalance: 1000000,
        currentBalance: 1000000,
        createdAt: DateTime.now(),
      ),
    ]);
  }

  @override
  Stream<List<DebtAccountModel>> watchAll() =>
      Stream.value(List.unmodifiable(_accounts));

  @override
  Future<void> logPayment(PaymentLogModel log) async {
    final i = _accounts.indexWhere((a) => a.id == log.debtAccountId);
    if (i < 0) return;
    final a = _accounts[i];
    final newBal = (a.currentBalance - log.amount).clamp(0, a.startingBalance);
    _accounts[i] = a.copyWith(currentBalance: newBal.toInt());
    _payments.add(log.copyWith(id: _nextPaymentId++));
  }

  @override
  Future<void> updateBalance(int id, int newBalance) async {
    final i = _accounts.indexWhere((a) => a.id == id);
    if (i >= 0) {
      _accounts[i] = _accounts[i].copyWith(currentBalance: newBalance);
    }
  }

  @override
  Stream<List<PaymentLogModel>> watchPayments(int debtAccountId) =>
      Stream.value(
          _payments.where((p) => p.debtAccountId == debtAccountId).toList());
}
