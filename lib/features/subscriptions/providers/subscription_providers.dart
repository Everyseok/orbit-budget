import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/subscriptions/repositories/isar_subscription_repository.dart';
import 'package:orbit_budget/features/subscriptions/repositories/subscription_repository.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return IsarSubscriptionRepository(ref.watch(isarServiceProvider));
});

final subscriptionListProvider = StreamProvider<List<SubscriptionModel>>((ref) {
  return ref.watch(subscriptionRepositoryProvider).watchAll();
});

final activeSubscriptionTotalProvider = Provider<int>((ref) => 0);
