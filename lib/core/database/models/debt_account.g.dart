// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_account.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDebtAccountCollection on Isar {
  IsarCollection<DebtAccount> get debtAccounts => this.collection();
}

const DebtAccountSchema = CollectionSchema(
  name: r'DebtAccount',
  id: -1204779015798691843,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentBalance': PropertySchema(
      id: 1,
      name: r'currentBalance',
      type: IsarType.long,
    ),
    r'label': PropertySchema(
      id: 2,
      name: r'label',
      type: IsarType.string,
    ),
    r'startingBalance': PropertySchema(
      id: 3,
      name: r'startingBalance',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _DebtAccounttypeEnumValueMap,
    )
  },
  estimateSize: _debtAccountEstimateSize,
  serialize: _debtAccountSerialize,
  deserialize: _debtAccountDeserialize,
  deserializeProp: _debtAccountDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _debtAccountGetId,
  getLinks: _debtAccountGetLinks,
  attach: _debtAccountAttach,
  version: '3.1.0+1',
);

int _debtAccountEstimateSize(
  DebtAccount object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.label.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _debtAccountSerialize(
  DebtAccount object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.currentBalance);
  writer.writeString(offsets[2], object.label);
  writer.writeLong(offsets[3], object.startingBalance);
  writer.writeString(offsets[4], object.type.name);
}

DebtAccount _debtAccountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DebtAccount();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.currentBalance = reader.readLong(offsets[1]);
  object.id = id;
  object.label = reader.readString(offsets[2]);
  object.startingBalance = reader.readLong(offsets[3]);
  object.type =
      _DebtAccounttypeValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          DebtAccountType.loan;
  return object;
}

P _debtAccountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_DebtAccounttypeValueEnumMap[reader.readStringOrNull(offset)] ??
          DebtAccountType.loan) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DebtAccounttypeEnumValueMap = {
  r'loan': r'loan',
  r'credit': r'credit',
};
const _DebtAccounttypeValueEnumMap = {
  r'loan': DebtAccountType.loan,
  r'credit': DebtAccountType.credit,
};

Id _debtAccountGetId(DebtAccount object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _debtAccountGetLinks(DebtAccount object) {
  return [];
}

void _debtAccountAttach(
    IsarCollection<dynamic> col, Id id, DebtAccount object) {
  object.id = id;
}

extension DebtAccountQueryWhereSort
    on QueryBuilder<DebtAccount, DebtAccount, QWhere> {
  QueryBuilder<DebtAccount, DebtAccount, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DebtAccountQueryWhere
    on QueryBuilder<DebtAccount, DebtAccount, QWhereClause> {
  QueryBuilder<DebtAccount, DebtAccount, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DebtAccount, DebtAccount, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterWhereClause> idBetween(
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

extension DebtAccountQueryFilter
    on QueryBuilder<DebtAccount, DebtAccount, QFilterCondition> {
  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      currentBalanceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentBalance',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      currentBalanceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentBalance',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      currentBalanceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentBalance',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      currentBalanceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      labelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      startingBalanceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startingBalance',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      startingBalanceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startingBalance',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      startingBalanceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startingBalance',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      startingBalanceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startingBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeEqualTo(
    DebtAccountType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeGreaterThan(
    DebtAccountType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeLessThan(
    DebtAccountType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeBetween(
    DebtAccountType lower,
    DebtAccountType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension DebtAccountQueryObject
    on QueryBuilder<DebtAccount, DebtAccount, QFilterCondition> {}

extension DebtAccountQueryLinks
    on QueryBuilder<DebtAccount, DebtAccount, QFilterCondition> {}

extension DebtAccountQuerySortBy
    on QueryBuilder<DebtAccount, DebtAccount, QSortBy> {
  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy>
      sortByCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByStartingBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingBalance', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy>
      sortByStartingBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingBalance', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension DebtAccountQuerySortThenBy
    on QueryBuilder<DebtAccount, DebtAccount, QSortThenBy> {
  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy>
      thenByCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByStartingBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingBalance', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy>
      thenByStartingBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startingBalance', Sort.desc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension DebtAccountQueryWhereDistinct
    on QueryBuilder<DebtAccount, DebtAccount, QDistinct> {
  QueryBuilder<DebtAccount, DebtAccount, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QDistinct> distinctByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentBalance');
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QDistinct>
      distinctByStartingBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startingBalance');
    });
  }

  QueryBuilder<DebtAccount, DebtAccount, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension DebtAccountQueryProperty
    on QueryBuilder<DebtAccount, DebtAccount, QQueryProperty> {
  QueryBuilder<DebtAccount, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DebtAccount, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DebtAccount, int, QQueryOperations> currentBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentBalance');
    });
  }

  QueryBuilder<DebtAccount, String, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<DebtAccount, int, QQueryOperations> startingBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startingBalance');
    });
  }

  QueryBuilder<DebtAccount, DebtAccountType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
