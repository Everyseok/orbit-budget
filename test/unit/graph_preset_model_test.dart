import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_budget/core/constants/enums.dart';
import 'package:orbit_budget/features/analytics/models/graph_preset_model.dart';

void main() {
  final base = GraphPresetModel(
    id: 1,
    name: 'Test Preset',
    chartType: ChartType.categoryPie,
    dateRange: DateRangeFilter.last30Days,
    categoryFilter: [CategoryType.food, CategoryType.transport],
    createdAt: DateTime(2024, 6, 1),
  );

  group('GraphPresetModel.toJson / fromJson', () {
    test('round-trip preserves all fields', () {
      final json = base.toJson();
      final back = GraphPresetModel.fromJson(json);
      expect(back.id, equals(base.id));
      expect(back.name, equals(base.name));
      expect(back.chartType, equals(base.chartType));
      expect(back.dateRange, equals(base.dateRange));
      expect(back.categoryFilter, equals(base.categoryFilter));
      expect(back.createdAt, equals(base.createdAt));
    });

    test('toJson uses enum name strings', () {
      final json = base.toJson();
      expect(json['chartType'], equals('categoryPie'));
      expect(json['dateRange'], equals('last30Days'));
      expect((json['categoryFilter'] as List).first, equals('food'));
    });
  });

  group('GraphPresetModel.copyWith', () {
    test('changes only specified field', () {
      final copy = base.copyWith(name: 'New Name');
      expect(copy.name, equals('New Name'));
      expect(copy.chartType, equals(base.chartType));
      expect(copy.id, equals(base.id));
    });

    test('empty categoryFilter is valid', () {
      final copy = base.copyWith(categoryFilter: []);
      expect(copy.categoryFilter, isEmpty);
    });
  });

  group('GraphPresetModel.fromJson edge cases', () {
    test('all ChartType values round-trip', () {
      for (final ct in ChartType.values) {
        final m = base.copyWith(chartType: ct);
        expect(GraphPresetModel.fromJson(m.toJson()).chartType, equals(ct));
      }
    });

    test('all DateRangeFilter values round-trip', () {
      for (final dr in DateRangeFilter.values) {
        final m = base.copyWith(dateRange: dr);
        expect(GraphPresetModel.fromJson(m.toJson()).dateRange, equals(dr));
      }
    });
  });
}
