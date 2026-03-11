import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Abstract interface for local push notifications.
/// Real implementation: [FlutterLocalNotificationService].
/// Test stub: [FakeNotificationService].
abstract class NotificationService {
  /// Initialise the notification plugin. Call once in [main].
  Future<void> init();

  /// Ask the OS for notification permission (iOS prompt / Android 13+).
  Future<void> requestPermission();

  /// Schedule a "renews in 3 days" reminder for a subscription.
  /// [id] must be unique per subscription.
  Future<void> scheduleSubscriptionReminder({
    required int id,
    required String name,
    required int amountKrw,
    required DateTime billingDate,
  });

  /// Cancel all scheduled notifications.
  Future<void> cancelAll();

  /// Cancel a single notification by [id].
  Future<void> cancelById(int id);
}

/// Provider — must be overridden in [ProviderScope] (see main.dart).
final notificationServiceProvider = Provider<NotificationService>((ref) {
  throw StateError(
    'NotificationService must be initialised in main() and injected '
    'via ProviderScope.overrides',
  );
});
