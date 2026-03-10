import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/features/analytics/models/analytics_data.dart';
import 'package:orbit_budget/shared/models/debt_account_model.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';
import 'package:orbit_budget/shared/models/payment_log_model.dart';

class AnalyticsUtils {
  AnalyticsUtils._();

  static Map<CategoryType, int> categoryTotals(List<ExpenseModel> expenses) {
    final result = <CategoryType, int>{};
    for (final e in expenses) {
      result[e.category] = (result[e.category] ?? 0) + e.amount;
    }
    return result;
  }

  static List<DailyTotal> dailyTotals(
    List<ExpenseModel> expenses,
    DateTime reference, {
    int days = 30,
  }) {
    final result = <DailyTotal>[];
    for (int i = days - 1; i >= 0; i--) {
      final day = DateTime(reference.year, reference.month, reference.day)
          .subtract(Duration(days: i));
      final total = expenses
          .where((e) =>
              e.date.year == day.year &&
              e.date.month == day.month &&
              e.date.day == day.day)
          .fold(0, (s, e) => s + e.amount);
      result.add(DailyTotal(date: day, total: total));
    }
    return result;
  }

  static List<MonthlyTotal> monthlyTotals(
    List<ExpenseModel> expenses,
    DateTime reference, {
    int months = 6,
  }) {
    final result = <MonthlyTotal>[];
    for (int i = months - 1; i >= 0; i--) {
      final m = DateTime(reference.year, reference.month - i, 1);
      final total = expenses
          .where((e) => e.date.year == m.year && e.date.month == m.month)
          .fold(0, (s, e) => s + e.amount);
      result.add(MonthlyTotal(year: m.year, month: m.month, total: total));
    }
    return result;
  }

  /// Returns null when totalDebt == 0 or no payments in last 3 months.
  static DebtProjection? debtProjection(
    List<DebtAccountModel> accounts,
    List<PaymentLogModel> allPayments,
  ) {
    final totalDebt = accounts.fold(0, (s, a) => s + a.currentBalance);
    if (totalDebt == 0) return null;

    final now = DateTime.now();
    final cutoff = DateTime(now.year, now.month - 3, 1);
    final recent = allPayments.where((p) => p.date.isAfter(cutoff)).toList();
    if (recent.isEmpty) return null;

    final avgMonthly = recent.fold(0, (s, p) => s + p.amount) ~/ 3;
    if (avgMonthly == 0) return null;

    final months = (totalDebt / avgMonthly).ceil();
    return DebtProjection(
      totalDebt: totalDebt,
      avgMonthlyPayment: avgMonthly,
      estimatedMonthsRemaining: months,
      estimatedClearDate: DateTime(now.year, now.month + months, 1),
    );
  }
}
