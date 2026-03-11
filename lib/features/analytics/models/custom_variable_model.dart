import 'package:orbit_budget/core/constants/enums.dart';

/// App-layer model for a user-defined analytics variable.
/// No Isar persistence yet — TODO(stage4): add GraphVariableSchema when
/// full X/Y scatter UI is built.
class CustomVariableModel {
  final int id;
  final String name;
  final VariableSourceType sourceType;

  /// Identifies the specific source (e.g. category name, subscription id).
  final String sourceKey;

  final AxisValueType axisValueType;

  /// CSS hex color string, e.g. '#00D4FF'.
  final String colorHex;

  final DateTime createdAt;

  const CustomVariableModel({
    required this.id,
    required this.name,
    required this.sourceType,
    required this.sourceKey,
    required this.axisValueType,
    required this.colorHex,
    required this.createdAt,
  });

  CustomVariableModel copyWith({
    int? id,
    String? name,
    VariableSourceType? sourceType,
    String? sourceKey,
    AxisValueType? axisValueType,
    String? colorHex,
    DateTime? createdAt,
  }) =>
      CustomVariableModel(
        id: id ?? this.id,
        name: name ?? this.name,
        sourceType: sourceType ?? this.sourceType,
        sourceKey: sourceKey ?? this.sourceKey,
        axisValueType: axisValueType ?? this.axisValueType,
        colorHex: colorHex ?? this.colorHex,
        createdAt: createdAt ?? this.createdAt,
      );
}

/// Describes a chart query pairing two variables with optional curve fitting.
/// No persistence yet — TODO(stage4): persist as part of GraphPreset extension.
class ChartQueryModel {
  final int xVariableId;
  final int yVariableId;
  final DateRangeFilter dateRange;
  final FitModelType fitModelType;
  final AggregationUnit aggregationUnit;

  const ChartQueryModel({
    required this.xVariableId,
    required this.yVariableId,
    required this.dateRange,
    this.fitModelType = FitModelType.none,
    this.aggregationUnit = AggregationUnit.day,
  });
}
