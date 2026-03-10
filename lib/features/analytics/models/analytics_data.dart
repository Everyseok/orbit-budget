import 'package:orbit_budget/core/constants/enums.dart';

class DailyTotal {
  final DateTime date;
  final int total;
  const DailyTotal({required this.date, required this.total});
}

class MonthlyTotal {
  final int year;
  final int month;
  final int total;
  const MonthlyTotal({required this.year, required this.month, required this.total});
}

class DebtProjection {
  final int totalDebt;
  final int avgMonthlyPayment;
  final int estimatedMonthsRemaining;
  final DateTime? estimatedClearDate;

  const DebtProjection({
    required this.totalDebt,
    required this.avgMonthlyPayment,
    required this.estimatedMonthsRemaining,
    this.estimatedClearDate,
  });
}

class AnalyticsSnapshot {
  final Map<CategoryType, int> categoryTotals;
  final List<DailyTotal> dailyTotals;
  final List<MonthlyTotal> monthlyTotals;
  final int subscriptionMonthlyTotal;
  final int variableMonthlyTotal;
  final DebtProjection? debtProjection;
  final bool hasData;

  const AnalyticsSnapshot({
    required this.categoryTotals,
    required this.dailyTotals,
    required this.monthlyTotals,
    required this.subscriptionMonthlyTotal,
    required this.variableMonthlyTotal,
    this.debtProjection,
    required this.hasData,
  });

  factory AnalyticsSnapshot.empty() => const AnalyticsSnapshot(
        categoryTotals: {},
        dailyTotals: [],
        monthlyTotals: [],
        subscriptionMonthlyTotal: 0,
        variableMonthlyTotal: 0,
        debtProjection: null,
        hasData: false,
      );
}
