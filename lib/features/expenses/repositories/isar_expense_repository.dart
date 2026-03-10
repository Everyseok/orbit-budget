import 'package:isar/isar.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/database/models/expense_entry.dart';
import 'package:orbit_budget/features/expenses/repositories/expense_repository.dart';
import 'package:orbit_budget/shared/models/expense_model.dart';

class IsarExpenseRepository implements ExpenseRepository {
  final IsarService _svc;
  IsarExpenseRepository(this._svc);

  Isar get _db => _svc.db;

  @override
  Stream<List<ExpenseModel>> watchAll() =>
      _db.expenseEntrys
          .where()
          .sortByDateDesc()
          .watch(fireImmediately: true)
          .map((l) => l.map(ExpenseModel.fromEntity).toList());

  @override
  Stream<List<ExpenseModel>> watchByMonth(int year, int month) {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 1)
        .subtract(const Duration(milliseconds: 1));
    return _db.expenseEntrys
        .filter()
        .dateBetween(start, end)
        .sortByDateDesc()
        .watch(fireImmediately: true)
        .map((l) => l.map(ExpenseModel.fromEntity).toList());
  }

  @override
  Future<void> add(ExpenseModel m) async {
    final e = ExpenseEntry()
      ..date = m.date
      ..amount = m.amount
      ..category = m.category
      ..memo = m.memo
      ..isRecurring = m.isRecurring;
    await _db.writeTxn(() => _db.expenseEntrys.put(e));
  }

  @override
  Future<void> update(ExpenseModel m) async {
    final e = await _db.expenseEntrys.get(m.id);
    if (e == null) return;
    e
      ..date = m.date
      ..amount = m.amount
      ..category = m.category
      ..memo = m.memo
      ..isRecurring = m.isRecurring;
    await _db.writeTxn(() => _db.expenseEntrys.put(e));
  }

  @override
  Future<void> delete(int id) async =>
      _db.writeTxn(() => _db.expenseEntrys.delete(id));

  @override
  Future<List<ExpenseModel>> getByDateRange(
      DateTime start, DateTime end) async {
    final l = await _db.expenseEntrys
        .filter()
        .dateBetween(start, end)
        .sortByDateDesc()
        .findAll();
    return l.map(ExpenseModel.fromEntity).toList();
  }
}
