import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/enums.dart';

part 'subscription_item.g.dart';

@Collection()
class SubscriptionItem {
  Id id = Isar.autoIncrement;
  String name = '';
  int monthlyCost = 0;

  @Index(type: IndexType.value)
  int billingDay = 1;

  @Enumerated(EnumType.name)
  SubscriptionStatus status = SubscriptionStatus.active;

  String manageUrl = '';
  String logoEmoji = '💳';

  @Index(type: IndexType.value)
  late DateTime nextBillingDate;

  DateTime createdAt = DateTime.now();
  // NOTE: nextBillingDate must be kept in sync with billingDay by repository.
  // Stage 3 reserved: String? categoryTag;
}
