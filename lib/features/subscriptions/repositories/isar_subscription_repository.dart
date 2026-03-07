import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/subscriptions/repositories/subscription_repository.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';

class IsarSubscriptionRepository implements SubscriptionRepository {
  // ignore: unused_field
  final IsarService _isarService;
  IsarSubscriptionRepository(this._isarService);

  @override
  Stream<List<SubscriptionModel>> watchAll() => Stream.value([]);

  @override
  Future<void> add(SubscriptionModel item) async {}

  @override
  Future<void> update(SubscriptionModel item) async {}

  @override
  Future<void> delete(int id) async {}

  @override
  Future<void> seed() async {}
}
