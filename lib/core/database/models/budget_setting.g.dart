// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBudgetSettingCollection on Isar {
  IsarCollection<BudgetSetting> get budgetSettings => this.collection();
}

const BudgetSettingSchema = CollectionSchema(
  name: r'BudgetSetting',
  id: 6102780898268563948,
  properties: {
    r'currency': PropertySchema(
      id: 0,
      name: r'currency',
      type: IsarType.string,
    ),
    r'monthlyBudget': PropertySchema(
      id: 1,
      name: r'monthlyBudget',
      type: IsarType.long,
    )
  },
  estimateSize: _budgetSettingEstimateSize,
  serialize: _budgetSettingSerialize,
  deserialize: _budgetSettingDeserialize,
  deserializeProp: _budgetSettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _budgetSettingGetId,
  getLinks: _budgetSettingGetLinks,
  attach: _budgetSettingAttach,
  version: '3.1.0+1',
);

int _budgetSettingEstimateSize(
  BudgetSetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.currency.length * 3;
  return bytesCount;
}

void _budgetSettingSerialize(
  BudgetSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.currency);
  writer.writeLong(offsets[1], object.monthlyBudget);
}

BudgetSetting _budgetSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BudgetSetting();
  object.currency = reader.readString(offsets[0]);
  object.id = id;
  object.monthlyBudget = reader.readLong(offsets[1]);
  return object;
}

P _budgetSettingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _budgetSettingGetId(BudgetSetting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _budgetSettingGetLinks(BudgetSetting object) {
  return [];
}

void _budgetSettingAttach(
    IsarCollection<dynamic> col, Id id, BudgetSetting object) {
  object.id = id;
}

extension BudgetSettingQueryWhereSort
    on QueryBuilder<BudgetSetting, BudgetSetting, QWhere> {
  QueryBuilder<BudgetSetting, BudgetSetting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BudgetSettingQueryWhere
    on QueryBuilder<BudgetSetting, BudgetSetting, QWhereClause> {
  QueryBuilder<BudgetSetting, BudgetSetting, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BudgetSettingQueryFilter
    on QueryBuilder<BudgetSetting, BudgetSetting, QFilterCondition> {
  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      monthlyBudgetEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyBudget',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      monthlyBudgetGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyBudget',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      monthlyBudgetLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyBudget',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterFilterCondition>
      monthlyBudgetBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyBudget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BudgetSettingQueryObject
    on QueryBuilder<BudgetSetting, BudgetSetting, QFilterCondition> {}

extension BudgetSettingQueryLinks
    on QueryBuilder<BudgetSetting, BudgetSetting, QFilterCondition> {}

extension BudgetSettingQuerySortBy
    on QueryBuilder<BudgetSetting, BudgetSetting, QSortBy> {
  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy>
      sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy>
      sortByMonthlyBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.asc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy>
      sortByMonthlyBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.desc);
    });
  }
}

extension BudgetSettingQuerySortThenBy
    on QueryBuilder<BudgetSetting, BudgetSetting, QSortThenBy> {
  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy>
      thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy>
      thenByMonthlyBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.asc);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QAfterSortBy>
      thenByMonthlyBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBudget', Sort.desc);
    });
  }
}

extension BudgetSettingQueryWhereDistinct
    on QueryBuilder<BudgetSetting, BudgetSetting, QDistinct> {
  QueryBuilder<BudgetSetting, BudgetSetting, QDistinct> distinctByCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetSetting, BudgetSetting, QDistinct>
      distinctByMonthlyBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyBudget');
    });
  }
}

extension BudgetSettingQueryProperty
    on QueryBuilder<BudgetSetting, BudgetSetting, QQueryProperty> {
  QueryBuilder<BudgetSetting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BudgetSetting, String, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<BudgetSetting, int, QQueryOperations> monthlyBudgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyBudget');
    });
  }
}
