import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/debt/repositories/debt_repository.dart';
import 'package:orbit_budget/features/debt/repositories/isar_debt_repository.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

final debtRepositoryProvider = Provider<DebtRepository>((ref) {
  return IsarDebtRepository(ref.watch(isarServiceProvider));
});

final debtAccountsProvider = StreamProvider<List<DebtAccountModel>>((ref) {
  return ref.watch(debtRepositoryProvider).watchAll();
});

final totalDebtProvider = Provider<int>((ref) => 0);

final paymentLogProvider =
    StreamProvider.family<List<PaymentLogModel>, int>((ref, debtAccountId) {
  return ref.watch(debtRepositoryProvider).watchPayments(debtAccountId);
});
