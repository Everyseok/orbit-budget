import 'package:isar/isar.dart';
import 'package:orbit_budget/core/constants/enums.dart';
part 'graph_preset.g.dart';

@collection
class GraphPreset {
  Id id = Isar.autoIncrement;

  @Index()
  late String name;

  @Enumerated(EnumType.name)
  late ChartType chartType;

  @Enumerated(EnumType.name)
  late DateRangeFilter dateRange;

  // CategoryType enum names stored as List<String>
  // (Isar does not support List<Enum> directly)
  late List<String> categoryFilter;

  late DateTime createdAt;
}
