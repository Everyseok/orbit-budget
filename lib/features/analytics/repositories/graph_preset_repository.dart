import 'package:orbit_budget/features/analytics/models/graph_preset_model.dart';

abstract class GraphPresetRepository {
  Stream<List<GraphPresetModel>> watchAll();
  Future<void> save(GraphPresetModel preset);
  Future<void> delete(int id);
}
