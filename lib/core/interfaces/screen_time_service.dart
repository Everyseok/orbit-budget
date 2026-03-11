/// Interface for future Screen Time / usage data ingestion.
/// Implementation requires com.apple.developer.family-controls (iOS)
/// or PACKAGE_USAGE_STATS (Android) — both deferred to Stage 3b.
/// TODO(stage3b): implement with FamilyControlsScreenTimeService on iOS.
/// TODO(stage3b): implement with UsageStatsScreenTimeService on Android.
abstract class ScreenTimeService {
  /// Returns daily usage in minutes for a given app bundle/package id.
  Future<Map<DateTime, int>> getDailyUsageMinutes(String appId);

  /// Returns total weekly usage in minutes for all tracked apps.
  Future<Map<String, int>> getWeeklyUsageSummary();

  /// Whether the platform supports screen time queries.
  bool get isSupported;
}
