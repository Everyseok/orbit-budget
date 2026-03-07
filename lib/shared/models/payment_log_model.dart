import 'package:orbit_budget/core/database/models/payment_log.dart';

class PaymentLogModel {
  final int id;
  final int debtAccountId;
  final int amount;
  final DateTime date;
  final String memo;

  const PaymentLogModel({
    required this.id,
    required this.debtAccountId,
    required this.amount,
    required this.date,
    this.memo = '',
  });

  PaymentLogModel copyWith({
    int? id,
    int? debtAccountId,
    int? amount,
    DateTime? date,
    String? memo,
  }) =>
      PaymentLogModel(
        id: id ?? this.id,
        debtAccountId: debtAccountId ?? this.debtAccountId,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        memo: memo ?? this.memo,
      );

  factory PaymentLogModel.fromEntity(PaymentLog e) => PaymentLogModel(
        id: e.id,
        debtAccountId: e.debtAccountId,
        amount: e.amount,
        date: e.date,
        memo: e.memo,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'debtAccountId': debtAccountId,
        'amount': amount,
        'date': date.toIso8601String(),
        'memo': memo,
      };

  factory PaymentLogModel.fromJson(Map<String, dynamic> j) => PaymentLogModel(
        id: j['id'] as int,
        debtAccountId: j['debtAccountId'] as int,
        amount: j['amount'] as int,
        date: DateTime.parse(j['date'] as String),
        memo: j['memo'] as String? ?? '',
      );
}
