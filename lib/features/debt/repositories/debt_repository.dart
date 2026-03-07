import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

abstract class DebtRepository {
  Stream<List<DebtAccountModel>> watchAll();
  Future<void> logPayment(PaymentLogModel log);
  Future<void> updateBalance(int debtAccountId, int newBalance);
  Stream<List<PaymentLogModel>> watchPayments(int debtAccountId);
  Future<void> seed(); // Inserts default 2 accounts on first launch
}
