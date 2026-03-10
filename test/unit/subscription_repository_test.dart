import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/shared/models/subscription_model.dart';
import 'fakes.dart';

void main() {
  group('FakeSubscriptionRepository', () {
    late FakeSubscriptionRepository repo;
    setUp(() => repo = FakeSubscriptionRepository());

    test('seed inserts exactly one item', () async {
      await repo.seed();
      expect((await repo.watchAll().first).length, equals(1));
    });

    test('seed is idempotent', () async {
      await repo.seed();
      await repo.seed();
      expect((await repo.watchAll().first).length, equals(1));
    });

    test('add stores item with assigned id > 0', () async {
      await repo.add(SubscriptionModel(
        id: 0,
        name: 'Spotify',
        monthlyCost: 10900,
        billingDay: 5,
        status: SubscriptionStatus.active,
        manageUrl: 'https://spotify.com',
        logoEmoji: '🎵',
        nextBillingDate: DateTime.now(),
        createdAt: DateTime.now(),
      ));
      final list = await repo.watchAll().first;
      expect(list.length, equals(1));
      expect(list.first.id, greaterThan(0));
    });

    test('delete removes item', () async {
      await repo.seed();
      final id = (await repo.watchAll().first).first.id;
      await repo.delete(id);
      expect(await repo.watchAll().first, isEmpty);
    });

    test('update changes status without touching other fields', () async {
      await repo.seed();
      final orig = (await repo.watchAll().first).first;
      await repo.update(orig.copyWith(status: SubscriptionStatus.paused));
      final updated = (await repo.watchAll().first).first;
      expect(updated.status, equals(SubscriptionStatus.paused));
      expect(updated.name, equals(orig.name));
      expect(updated.monthlyCost, equals(orig.monthlyCost));
    });
  });
}
