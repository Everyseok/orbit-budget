import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/models/debt_account.dart';

class DebtAccountModel {
  final int id;
  final String label;
  final DebtAccountType type;
  final int startingBalance;
  final int currentBalance;
  final DateTime createdAt;

  const DebtAccountModel({
    required this.id,
    required this.label,
    required this.type,
    required this.startingBalance,
    required this.currentBalance,
    required this.createdAt,
  });

  double get progressRatio {
    if (startingBalance == 0) return 0;
    final paid = startingBalance - currentBalance;
    return (paid / startingBalance).clamp(0.0, 1.0);
  }

  DebtAccountModel copyWith({
    int? id,
    String? label,
    DebtAccountType? type,
    int? startingBalance,
    int? currentBalance,
    DateTime? createdAt,
  }) =>
      DebtAccountModel(
        id: id ?? this.id,
        label: label ?? this.label,
        type: type ?? this.type,
        startingBalance: startingBalance ?? this.startingBalance,
        currentBalance: currentBalance ?? this.currentBalance,
        createdAt: createdAt ?? this.createdAt,
      );

  factory DebtAccountModel.fromEntity(DebtAccount e) => DebtAccountModel(
        id: e.id,
        label: e.label,
        type: e.type,
        startingBalance: e.startingBalance,
        currentBalance: e.currentBalance,
        createdAt: e.createdAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'type': type.name,
        'startingBalance': startingBalance,
        'currentBalance': currentBalance,
        'createdAt': createdAt.toIso8601String(),
      };

  factory DebtAccountModel.fromJson(Map<String, dynamic> j) => DebtAccountModel(
        id: j['id'] as int,
        label: j['label'] as String,
        type: DebtAccountType.values.byName(j['type'] as String),
        startingBalance: j['startingBalance'] as int,
        currentBalance: j['currentBalance'] as int,
        createdAt: DateTime.parse(j['createdAt'] as String),
      );
}
