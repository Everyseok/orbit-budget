import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/models/subscription_item.dart';

class SubscriptionModel {
  final int id;
  final String name;
  final int monthlyCost;
  final int billingDay;
  final SubscriptionStatus status;
  final String manageUrl;
  final String logoEmoji;
  final DateTime nextBillingDate;
  final DateTime createdAt;

  const SubscriptionModel({
    required this.id,
    required this.name,
    required this.monthlyCost,
    required this.billingDay,
    required this.status,
    required this.nextBillingDate,
    required this.createdAt,
    this.manageUrl = '',
    this.logoEmoji = '💳',
  });

  SubscriptionModel copyWith({
    int? id,
    String? name,
    int? monthlyCost,
    int? billingDay,
    SubscriptionStatus? status,
    String? manageUrl,
    String? logoEmoji,
    DateTime? nextBillingDate,
    DateTime? createdAt,
  }) =>
      SubscriptionModel(
        id: id ?? this.id,
        name: name ?? this.name,
        monthlyCost: monthlyCost ?? this.monthlyCost,
        billingDay: billingDay ?? this.billingDay,
        status: status ?? this.status,
        manageUrl: manageUrl ?? this.manageUrl,
        logoEmoji: logoEmoji ?? this.logoEmoji,
        nextBillingDate: nextBillingDate ?? this.nextBillingDate,
        createdAt: createdAt ?? this.createdAt,
      );

  factory SubscriptionModel.fromEntity(SubscriptionItem e) => SubscriptionModel(
        id: e.id,
        name: e.name,
        monthlyCost: e.monthlyCost,
        billingDay: e.billingDay,
        status: e.status,
        manageUrl: e.manageUrl,
        logoEmoji: e.logoEmoji,
        nextBillingDate: e.nextBillingDate,
        createdAt: e.createdAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'monthlyCost': monthlyCost,
        'billingDay': billingDay,
        'status': status.name,
        'manageUrl': manageUrl,
        'logoEmoji': logoEmoji,
        'nextBillingDate': nextBillingDate.toIso8601String(),
        'createdAt': createdAt.toIso8601String(),
      };

  factory SubscriptionModel.fromJson(Map<String, dynamic> j) =>
      SubscriptionModel(
        id: j['id'] as int,
        name: j['name'] as String,
        monthlyCost: j['monthlyCost'] as int,
        billingDay: j['billingDay'] as int,
        status: SubscriptionStatus.values.byName(j['status'] as String),
        manageUrl: j['manageUrl'] as String? ?? '',
        logoEmoji: j['logoEmoji'] as String? ?? '💳',
        nextBillingDate: DateTime.parse(j['nextBillingDate'] as String),
        createdAt: DateTime.parse(j['createdAt'] as String),
      );
}
