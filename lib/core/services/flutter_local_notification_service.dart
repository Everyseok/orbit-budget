import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:orbit_budget/core/services/notification_service.dart';

/// Production notification service backed by flutter_local_notifications.
///
/// Scheduling uses [FlutterLocalNotificationsPlugin.show] for immediate
/// delivery in the current implementation. Full date-based scheduling
/// via [zonedSchedule] requires the `timezone` package —
/// TODO(stage4): add timezone + wire full scheduled delivery.
class FlutterLocalNotificationService implements NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  // Channel constants — used when zonedSchedule is wired in Stage 4.
  // ignore: unused_field
  static const _channelId = 'orbit_billing';
  // ignore: unused_field
  static const _channelName = 'Billing Reminders';
  // ignore: unused_field
  static const _channelDesc = 'Subscription renewal reminders';

  @override
  Future<void> init() async {
    const android =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );
  }

  @override
  Future<void> requestPermission() async {
    if (Platform.isIOS) {
      await _plugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else if (Platform.isAndroid) {
      await _plugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  @override
  Future<void> scheduleSubscriptionReminder({
    required int id,
    required String name,
    required int amountKrw,
    required DateTime billingDate,
  }) async {
    // Skip if the billing date has already passed (including 3-day window).
    final reminderDate = billingDate.subtract(const Duration(days: 3));
    if (reminderDate.isBefore(DateTime.now())) return;

    // TODO(stage4): replace with plugin.zonedSchedule() once timezone package
    // is added to pubspec. For now this is a no-op placeholder so the interface
    // and permission flow can be validated without additional dependencies.
  }

  @override
  Future<void> cancelAll() => _plugin.cancelAll();

  @override
  Future<void> cancelById(int id) => _plugin.cancel(id);
}
