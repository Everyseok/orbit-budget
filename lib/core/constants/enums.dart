// ────────────────────────────────────────────
// CategoryType
// ────────────────────────────────────────────
enum CategoryType {
  food,
  transport,
  living,
  telecom,
  health,
  other;

  String get emoji {
    switch (this) {
      case CategoryType.food:
        return '🚀';
      case CategoryType.transport:
        return '🛰️';
      case CategoryType.living:
        return '🌍';
      case CategoryType.telecom:
        return '⚡';
      case CategoryType.health:
        return '🔭';
      case CategoryType.other:
        return '🪐';
    }
  }

  /// Returns the l10n key — resolve via AppLocalizations in widgets.
  String get l10nKey {
    switch (this) {
      case CategoryType.food:
        return 'category_food';
      case CategoryType.transport:
        return 'category_transport';
      case CategoryType.living:
        return 'category_living';
      case CategoryType.telecom:
        return 'category_telecom';
      case CategoryType.health:
        return 'category_health';
      case CategoryType.other:
        return 'category_other';
    }
  }
}

// ────────────────────────────────────────────
// SubscriptionStatus
// ────────────────────────────────────────────
enum SubscriptionStatus {
  active,
  paused,
  cancelling;

  String get l10nKey {
    switch (this) {
      case SubscriptionStatus.active:
        return 'subscription_label_active';
      case SubscriptionStatus.paused:
        return 'subscription_label_paused';
      case SubscriptionStatus.cancelling:
        return 'subscription_label_cancelling';
    }
  }
}

// ────────────────────────────────────────────
// DebtAccountType
// ────────────────────────────────────────────
enum DebtAccountType { loan, credit }

// Stage 3 reserved
enum ExportFormat { csv }

// ────────────────────────────────────────────
// ChartType
// ────────────────────────────────────────────
enum ChartType {
  categoryPie,
  dailyLine,
  monthlyBar,
  subVsVariable,
  costRanking,
}

// ────────────────────────────────────────────
// DateRangeFilter
// ────────────────────────────────────────────
enum DateRangeFilter {
  last30Days,
  thisMonth,
  last3Months,
  last6Months,
}
