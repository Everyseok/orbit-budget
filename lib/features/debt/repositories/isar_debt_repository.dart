import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/database/models/debt_account.dart';
import 'package:orbit_budget/core/database/models/payment_log.dart';
import 'package:orbit_budget/features/debt/repositories/debt_repository.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

class IsarDebtRepository implements DebtRepository {
  final IsarService _svc;
  IsarDebtRepository(this._svc);

  Isar get _db => _svc.db;

  @override
  Future<void> seed() async {
    if (await _db.debtAccounts.count() > 0) return;
    // label intentionally empty — UI resolves display via l10n + type
    final accounts = [
      DebtAccount()
        ..label = ''
        ..type = DebtAccountType.loan
        ..startingBalance = AppConstants.studentLoanDefault
        ..currentBalance = AppConstants.studentLoanDefault
        ..createdAt = DateTime.now(),
      DebtAccount()
        ..label = ''
        ..type = DebtAccountType.credit
        ..startingBalance = AppConstants.creditCardDefault
        ..currentBalance = AppConstants.creditCardDefault
        ..createdAt = DateTime.now(),
    ];
    await _db.writeTxn(() => _db.debtAccounts.putAll(accounts));
  }

  @override
  Stream<List<DebtAccountModel>> watchAll() =>
      _db.debtAccounts
          .where()
          .watch(fireImmediately: true)
          .map((l) => l.map(DebtAccountModel.fromEntity).toList());

  @override
  Future<void> logPayment(PaymentLogModel log) async {
    final a = await _db.debtAccounts.get(log.debtAccountId);
    if (a == null) return;
    final newBal =
        (a.currentBalance - log.amount).clamp(0, a.startingBalance);
    final entry = PaymentLog()
      ..debtAccountId = log.debtAccountId
      ..amount = log.amount
      ..date = log.date
      ..memo = log.memo;
    await _db.writeTxn(() async {
      a.currentBalance = newBal.toInt();
      await _db.debtAccounts.put(a);
      await _db.paymentLogs.put(entry);
    });
  }

  @override
  Future<void> updateBalance(int debtAccountId, int newBalance) async {
    final a = await _db.debtAccounts.get(debtAccountId);
    if (a == null) return;
    a.currentBalance = newBalance.clamp(0, a.startingBalance).toInt();
    await _db.writeTxn(() => _db.debtAccounts.put(a));
  }

  @override
  Stream<List<PaymentLogModel>> watchPayments(int debtAccountId) =>
      _db.paymentLogs
          .filter()
          .debtAccountIdEqualTo(debtAccountId)
          .sortByDateDesc()
          .watch(fireImmediately: true)
          .map((l) => l.map(PaymentLogModel.fromEntity).toList());
}
