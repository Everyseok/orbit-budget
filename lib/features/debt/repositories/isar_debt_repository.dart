import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/debt/repositories/debt_repository.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

class IsarDebtRepository implements DebtRepository {
  // ignore: unused_field
  final IsarService _isarService;
  IsarDebtRepository(this._isarService);

  @override
  Stream<List<DebtAccountModel>> watchAll() => Stream.value([]);

  @override
  Future<void> logPayment(PaymentLogModel log) async {}

  @override
  Future<void> updateBalance(int debtAccountId, int newBalance) async {}

  @override
  Stream<List<PaymentLogModel>> watchPayments(int debtAccountId) =>
      Stream.value([]);

  @override
  Future<void> seed() async {}
}
