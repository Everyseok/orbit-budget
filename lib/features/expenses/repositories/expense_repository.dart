import 'package:orbit_budget/shared/models/expense_model.dart';

abstract class ExpenseRepository {
  Stream<List<ExpenseModel>> watchAll();
  Stream<List<ExpenseModel>> watchByMonth(int year, int month);
  Future<void> add(ExpenseModel expense);
  Future<void> update(ExpenseModel expense);
  Future<void> delete(int id);
  Future<List<ExpenseModel>> getByDateRange(DateTime start, DateTime end);
  // Stage 3: Future<Map<CategoryType, int>> getMonthlyBreakdown(int year, int month);
}
