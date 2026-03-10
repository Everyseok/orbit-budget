import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/subscriptions/repositories/isar_subscription_repository.dart';
import 'package:orbit_budget/features/subscriptions/repositories/subscription_repository.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) =>
    IsarSubscriptionRepository(ref.watch(isarServiceProvider)));

final subscriptionListProvider = StreamProvider<List<SubscriptionModel>>((ref) =>
    ref.watch(subscriptionRepositoryProvider).watchAll());

final activeSubscriptionTotalProvider = Provider<int>((ref) =>
    ref.watch(subscriptionListProvider).when(
      data: (l) => l
          .where((s) => s.status == SubscriptionStatus.active)
          .fold(0, (s, e) => s + e.monthlyCost),
      loading: () => 0,
      error: (_, __) => 0,
    ));

final activeSubscriptionCountProvider = Provider<int>((ref) =>
    ref.watch(subscriptionListProvider).when(
      data: (l) =>
          l.where((s) => s.status == SubscriptionStatus.active).length,
      loading: () => 0,
      error: (_, __) => 0,
    ));

class SubscriptionFormNotifier extends StateNotifier<AsyncValue<void>> {
  final SubscriptionRepository _repo;
  SubscriptionFormNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> add(SubscriptionModel m) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.add(m));
  }

  Future<void> update(SubscriptionModel m) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.update(m));
  }

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repo.delete(id));
  }

  Future<void> updateStatus(SubscriptionModel m, SubscriptionStatus s) =>
      update(m.copyWith(status: s));
}

final subscriptionFormProvider =
    StateNotifierProvider<SubscriptionFormNotifier, AsyncValue<void>>((ref) =>
        SubscriptionFormNotifier(ref.watch(subscriptionRepositoryProvider)));
