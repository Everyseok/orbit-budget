import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/core/database/models/graph_preset.dart';

class GraphPresetModel {
  final int id;
  final String name;
  final ChartType chartType;
  final DateRangeFilter dateRange;
  final List<CategoryType> categoryFilter;
  final DateTime createdAt;

  const GraphPresetModel({
    required this.id,
    required this.name,
    required this.chartType,
    required this.dateRange,
    required this.categoryFilter,
    required this.createdAt,
  });

  GraphPresetModel copyWith({
    int? id,
    String? name,
    ChartType? chartType,
    DateRangeFilter? dateRange,
    List<CategoryType>? categoryFilter,
    DateTime? createdAt,
  }) =>
      GraphPresetModel(
        id: id ?? this.id,
        name: name ?? this.name,
        chartType: chartType ?? this.chartType,
        dateRange: dateRange ?? this.dateRange,
        categoryFilter: categoryFilter ?? this.categoryFilter,
        createdAt: createdAt ?? this.createdAt,
      );

  factory GraphPresetModel.fromEntity(GraphPreset e) => GraphPresetModel(
        id: e.id,
        name: e.name,
        chartType: e.chartType,
        dateRange: e.dateRange,
        categoryFilter: e.categoryFilter
            .map((s) => CategoryType.values.firstWhere((c) => c.name == s))
            .toList(),
        createdAt: e.createdAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'chartType': chartType.name,
        'dateRange': dateRange.name,
        'categoryFilter': categoryFilter.map((c) => c.name).toList(),
        'createdAt': createdAt.toIso8601String(),
      };

  factory GraphPresetModel.fromJson(Map<String, dynamic> j) => GraphPresetModel(
        id: j['id'] as int,
        name: j['name'] as String,
        chartType: ChartType.values.byName(j['chartType'] as String),
        dateRange: DateRangeFilter.values.byName(j['dateRange'] as String),
        categoryFilter: (j['categoryFilter'] as List)
            .map((s) => CategoryType.values.byName(s as String))
            .toList(),
        createdAt: DateTime.parse(j['createdAt'] as String),
      );
}
