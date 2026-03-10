import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/debt/repositories/debt_repository.dart';
import 'package:orbit_budget/features/debt/repositories/isar_debt_repository.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

final debtRepositoryProvider = Provider<DebtRepository>((ref) =>
    IsarDebtRepository(ref.watch(isarServiceProvider)));

final debtAccountsProvider = StreamProvider<List<DebtAccountModel>>((ref) =>
    ref.watch(debtRepositoryProvider).watchAll());

final totalDebtProvider = Provider<int>((ref) =>
    ref.watch(debtAccountsProvider).when(
      data: (l) => l.fold(0, (s, a) => s + a.currentBalance),
      loading: () => 0,
      error: (_, __) => 0,
    ));

final paymentLogProvider =
    StreamProvider.family<List<PaymentLogModel>, int>((ref, id) =>
        ref.watch(debtRepositoryProvider).watchPayments(id));

class DebtPaymentNotifier extends StateNotifier<AsyncValue<void>> {
  final DebtRepository _repo;
  DebtPaymentNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> logPayment({
    required int debtAccountId,
    required int amount,
    required DateTime date,
    String memo = '',
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.logPayment(PaymentLogModel(
          id: 0,
          debtAccountId: debtAccountId,
          amount: amount,
          date: date,
          memo: memo,
        )));
  }
}

final debtPaymentProvider =
    StateNotifierProvider<DebtPaymentNotifier, AsyncValue<void>>((ref) =>
        DebtPaymentNotifier(ref.watch(debtRepositoryProvider)));
