import 'package:orbit_budget/core/services/notification_service.dart';

class FakeNotificationService implements NotificationService {
  bool initCalled = false;
  bool permissionRequested = false;
  final List<int> cancelledIds = [];
  bool cancelAllCalled = false;
  final List<Map<String, dynamic>> scheduled = [];

  @override
  Future<void> init() async => initCalled = true;

  @override
  Future<void> requestPermission() async => permissionRequested = true;

  @override
  Future<void> scheduleSubscriptionReminder({
    required int id,
    required String name,
    required int amountKrw,
    required DateTime billingDate,
  }) async =>
      scheduled.add({
        'id': id,
        'name': name,
        'amountKrw': amountKrw,
        'billingDate': billingDate,
      });

  @override
  Future<void> cancelAll() async => cancelAllCalled = true;

  @override
  Future<void> cancelById(int id) async => cancelledIds.add(id);
}
