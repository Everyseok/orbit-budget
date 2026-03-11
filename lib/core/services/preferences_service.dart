import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit_budget/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _prefs;
  PreferencesService(this._prefs);

  static const _keyOnboardingDone = 'onboarding_done';
  static const _keyNotificationsEnabled = 'notifications_enabled';
  static const _keyNotificationPermissionRequested =
      'notification_permission_requested';
  static const _keyLocale = 'locale';

  bool get onboardingDone => _prefs.getBool(_keyOnboardingDone) ?? false;
  Future<void> setOnboardingDone(bool v) =>
      _prefs.setBool(_keyOnboardingDone, v);

  bool get notificationsEnabled =>
      _prefs.getBool(_keyNotificationsEnabled) ?? false;
  Future<void> setNotificationsEnabled(bool v) =>
      _prefs.setBool(_keyNotificationsEnabled, v);

  bool get notificationPermissionRequested =>
      _prefs.getBool(_keyNotificationPermissionRequested) ?? false;
  Future<void> setNotificationPermissionRequested(bool v) =>
      _prefs.setBool(_keyNotificationPermissionRequested, v);

  String get locale =>
      _prefs.getString(_keyLocale) ?? AppConstants.defaultLocale;
  Future<void> setLocale(String v) => _prefs.setString(_keyLocale, v);
}

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  throw StateError(
    'PreferencesService must be initialized in main() and injected via ProviderScope.overrides',
  );
});
