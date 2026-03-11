import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/services/notification_service.dart';

import '../fakes/fake_notification_service.dart';

void main() {
  group('FakeNotificationService', () {
    late FakeNotificationService svc;

    setUp(() => svc = FakeNotificationService());

    test('implements NotificationService', () {
      expect(svc, isA<NotificationService>());
    });

    test('init() sets initCalled', () async {
      await svc.init();
      expect(svc.initCalled, isTrue);
    });

    test('requestPermission() sets permissionRequested', () async {
      await svc.requestPermission();
      expect(svc.permissionRequested, isTrue);
    });

    test('scheduleSubscriptionReminder() records entry', () async {
      final date = DateTime(2025, 1, 15);
      await svc.scheduleSubscriptionReminder(
        id: 42,
        name: 'Netflix',
        amountKrw: 17000,
        billingDate: date,
      );
      expect(svc.scheduled.length, equals(1));
      expect(svc.scheduled.first['id'], equals(42));
      expect(svc.scheduled.first['name'], equals('Netflix'));
      expect(svc.scheduled.first['billingDate'], equals(date));
    });

    test('cancelAll() sets cancelAllCalled', () async {
      await svc.cancelAll();
      expect(svc.cancelAllCalled, isTrue);
    });

    test('cancelById() records id', () async {
      await svc.cancelById(7);
      expect(svc.cancelledIds, contains(7));
    });

    test('multiple schedules accumulate', () async {
      await svc.scheduleSubscriptionReminder(
          id: 1, name: 'A', amountKrw: 5000,
          billingDate: DateTime.now());
      await svc.scheduleSubscriptionReminder(
          id: 2, name: 'B', amountKrw: 8000,
          billingDate: DateTime.now());
      expect(svc.scheduled.length, equals(2));
    });
  });
}
