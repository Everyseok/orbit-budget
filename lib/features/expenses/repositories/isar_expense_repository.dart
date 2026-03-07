import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/features/expenses/repositories/expense_repository.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';

class IsarExpenseRepository implements ExpenseRepository {
  // ignore: unused_field
  final IsarService _isarService;
  IsarExpenseRepository(this._isarService);

  @override
  Stream<List<ExpenseModel>> watchAll() => Stream.value([]);

  @override
  Stream<List<ExpenseModel>> watchByMonth(int y, int m) => Stream.value([]);

  @override
  Future<void> add(ExpenseModel e) async {}

  @override
  Future<void> update(ExpenseModel e) async {}

  @override
  Future<void> delete(int id) async {}

  @override
  Future<List<ExpenseModel>> getByDateRange(DateTime s, DateTime e) async => [];
}
