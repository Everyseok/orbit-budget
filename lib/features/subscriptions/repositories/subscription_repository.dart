import 'package:orbit_budget/shared/models/subscription_model.dart';

abstract class SubscriptionRepository {
  Stream<List<SubscriptionModel>> watchAll();
  Future<void> add(SubscriptionModel item);
  Future<void> update(SubscriptionModel item);
  Future<void> delete(int id);
  Future<void> seed(); // Inserts default 12 services on first launch
}
