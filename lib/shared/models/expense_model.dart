import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/models/expense_entry.dart';

class ExpenseModel {
  final int id;
  final DateTime date;
  final int amount;
  final CategoryType category;
  final String memo;
  final bool isRecurring;

  const ExpenseModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.category,
    this.memo = '',
    this.isRecurring = false,
  });

  ExpenseModel copyWith({
    int? id,
    DateTime? date,
    int? amount,
    CategoryType? category,
    String? memo,
    bool? isRecurring,
  }) =>
      ExpenseModel(
        id: id ?? this.id,
        date: date ?? this.date,
        amount: amount ?? this.amount,
        category: category ?? this.category,
        memo: memo ?? this.memo,
        isRecurring: isRecurring ?? this.isRecurring,
      );

  factory ExpenseModel.fromEntity(ExpenseEntry e) => ExpenseModel(
        id: e.id,
        date: e.date,
        amount: e.amount,
        category: e.category,
        memo: e.memo,
        isRecurring: e.isRecurring,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'amount': amount,
        'category': category.name,
        'memo': memo,
        'isRecurring': isRecurring,
      };

  factory ExpenseModel.fromJson(Map<String, dynamic> j) => ExpenseModel(
        id: j['id'] as int,
        date: DateTime.parse(j['date'] as String),
        amount: j['amount'] as int,
        category: CategoryType.values.byName(j['category'] as String),
        memo: j['memo'] as String? ?? '',
        isRecurring: j['isRecurring'] as bool? ?? false,
      );
}
