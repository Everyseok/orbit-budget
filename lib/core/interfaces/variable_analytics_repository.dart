import 'package:orbit_budget/features/analytics/models/custom_variable_model.dart';

/// Interface for future user-defined variable analytics.
/// TODO(stage4): implement with IsarVariableRepository when X/Y chart UI is built.
abstract class VariableAnalyticsRepository {
  Stream<List<CustomVariableModel>> watchAll();
  Future<void> save(CustomVariableModel variable);
  Future<void> delete(int id);
}
