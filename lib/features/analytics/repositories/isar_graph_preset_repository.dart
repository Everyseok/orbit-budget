import 'package:isar/isar.dart';
import 'package:orbit_budget/core/database/isar_service.dart';
import 'package:orbit_budget/core/database/models/graph_preset.dart';
import 'package:orbit_budget/features/analytics/models/graph_preset_model.dart';
import 'package:orbit_budget/features/analytics/repositories/graph_preset_repository.dart';

class IsarGraphPresetRepository implements GraphPresetRepository {
  final IsarService _svc;
  IsarGraphPresetRepository(this._svc);

  Isar get _db => _svc.db;

  @override
  Stream<List<GraphPresetModel>> watchAll() =>
      _db.graphPresets
          .where()
          .sortByName()
          .watch(fireImmediately: true)
          .map((l) => l.map(GraphPresetModel.fromEntity).toList());

  @override
  Future<void> save(GraphPresetModel model) async {
    final entity = GraphPreset()
      ..id = model.id
      ..name = model.name
      ..chartType = model.chartType
      ..dateRange = model.dateRange
      ..categoryFilter = model.categoryFilter.map((c) => c.name).toList()
      ..createdAt = model.createdAt;
    await _db.writeTxn(() => _db.graphPresets.put(entity));
  }

  @override
  Future<void> delete(int id) async =>
      _db.writeTxn(() => _db.graphPresets.delete(id));
}
