// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubscriptionItemCollection on Isar {
  IsarCollection<SubscriptionItem> get subscriptionItems => this.collection();
}

const SubscriptionItemSchema = CollectionSchema(
  name: r'SubscriptionItem',
  id: -6793530023618652293,
  properties: {
    r'billingDay': PropertySchema(
      id: 0,
      name: r'billingDay',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'logoEmoji': PropertySchema(
      id: 2,
      name: r'logoEmoji',
      type: IsarType.string,
    ),
    r'manageUrl': PropertySchema(
      id: 3,
      name: r'manageUrl',
      type: IsarType.string,
    ),
    r'monthlyCost': PropertySchema(
      id: 4,
      name: r'monthlyCost',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'nextBillingDate': PropertySchema(
      id: 6,
      name: r'nextBillingDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
      enumMap: _SubscriptionItemstatusEnumValueMap,
    )
  },
  estimateSize: _subscriptionItemEstimateSize,
  serialize: _subscriptionItemSerialize,
  deserialize: _subscriptionItemDeserialize,
  deserializeProp: _subscriptionItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'billingDay': IndexSchema(
      id: -1002157702429004480,
      name: r'billingDay',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'billingDay',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'nextBillingDate': IndexSchema(
      id: 4271195920879637159,
      name: r'nextBillingDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nextBillingDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _subscriptionItemGetId,
  getLinks: _subscriptionItemGetLinks,
  attach: _subscriptionItemAttach,
  version: '3.1.0+1',
);

int _subscriptionItemEstimateSize(
  SubscriptionItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.logoEmoji.length * 3;
  bytesCount += 3 + object.manageUrl.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _subscriptionItemSerialize(
  SubscriptionItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.billingDay);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.logoEmoji);
  writer.writeString(offsets[3], object.manageUrl);
  writer.writeLong(offsets[4], object.monthlyCost);
  writer.writeString(offsets[5], object.name);
  writer.writeDateTime(offsets[6], object.nextBillingDate);
  writer.writeString(offsets[7], object.status.name);
}

SubscriptionItem _subscriptionItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubscriptionItem();
  object.billingDay = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.logoEmoji = reader.readString(offsets[2]);
  object.manageUrl = reader.readString(offsets[3]);
  object.monthlyCost = reader.readLong(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.nextBillingDate = reader.readDateTime(offsets[6]);
  object.status = _SubscriptionItemstatusValueEnumMap[
          reader.readStringOrNull(offsets[7])] ??
      SubscriptionStatus.active;
  return object;
}

P _subscriptionItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (_SubscriptionItemstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SubscriptionStatus.active) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SubscriptionItemstatusEnumValueMap = {
  r'active': r'active',
  r'paused': r'paused',
  r'cancelling': r'cancelling',
};
const _SubscriptionItemstatusValueEnumMap = {
  r'active': SubscriptionStatus.active,
  r'paused': SubscriptionStatus.paused,
  r'cancelling': SubscriptionStatus.cancelling,
};

Id _subscriptionItemGetId(SubscriptionItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subscriptionItemGetLinks(SubscriptionItem object) {
  return [];
}

void _subscriptionItemAttach(
    IsarCollection<dynamic> col, Id id, SubscriptionItem object) {
  object.id = id;
}

extension SubscriptionItemQueryWhereSort
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QWhere> {
  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhere>
      anyBillingDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'billingDay'),
      );
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhere>
      anyNextBillingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nextBillingDate'),
      );
    });
  }
}

extension SubscriptionItemQueryWhere
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QWhereClause> {
  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      billingDayEqualTo(int billingDay) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'billingDay',
        value: [billingDay],
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      billingDayNotEqualTo(int billingDay) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billingDay',
              lower: [],
              upper: [billingDay],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billingDay',
              lower: [billingDay],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billingDay',
              lower: [billingDay],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'billingDay',
              lower: [],
              upper: [billingDay],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      billingDayGreaterThan(
    int billingDay, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'billingDay',
        lower: [billingDay],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      billingDayLessThan(
    int billingDay, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'billingDay',
        lower: [],
        upper: [billingDay],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      billingDayBetween(
    int lowerBillingDay,
    int upperBillingDay, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'billingDay',
        lower: [lowerBillingDay],
        includeLower: includeLower,
        upper: [upperBillingDay],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      nextBillingDateEqualTo(DateTime nextBillingDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nextBillingDate',
        value: [nextBillingDate],
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      nextBillingDateNotEqualTo(DateTime nextBillingDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextBillingDate',
              lower: [],
              upper: [nextBillingDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextBillingDate',
              lower: [nextBillingDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextBillingDate',
              lower: [nextBillingDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nextBillingDate',
              lower: [],
              upper: [nextBillingDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      nextBillingDateGreaterThan(
    DateTime nextBillingDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextBillingDate',
        lower: [nextBillingDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      nextBillingDateLessThan(
    DateTime nextBillingDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextBillingDate',
        lower: [],
        upper: [nextBillingDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterWhereClause>
      nextBillingDateBetween(
    DateTime lowerNextBillingDate,
    DateTime upperNextBillingDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nextBillingDate',
        lower: [lowerNextBillingDate],
        includeLower: includeLower,
        upper: [upperNextBillingDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SubscriptionItemQueryFilter
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QFilterCondition> {
  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      billingDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billingDay',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      billingDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billingDay',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      billingDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billingDay',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      billingDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billingDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoEmoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoEmoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoEmoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoEmoji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoEmoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoEmoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoEmoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoEmoji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoEmoji',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      logoEmojiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoEmoji',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'manageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'manageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'manageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'manageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      manageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'manageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      monthlyCostEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyCost',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      monthlyCostGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyCost',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      monthlyCostLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyCost',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      monthlyCostBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nextBillingDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextBillingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nextBillingDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextBillingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nextBillingDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextBillingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      nextBillingDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextBillingDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusEqualTo(
    SubscriptionStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusGreaterThan(
    SubscriptionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusLessThan(
    SubscriptionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusBetween(
    SubscriptionStatus lower,
    SubscriptionStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension SubscriptionItemQueryObject
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QFilterCondition> {}

extension SubscriptionItemQueryLinks
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QFilterCondition> {}

extension SubscriptionItemQuerySortBy
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QSortBy> {
  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByBillingDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingDay', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByBillingDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingDay', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByLogoEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoEmoji', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByLogoEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoEmoji', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByManageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageUrl', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByManageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageUrl', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByMonthlyCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyCost', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByMonthlyCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyCost', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByNextBillingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBillingDate', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByNextBillingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBillingDate', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SubscriptionItemQuerySortThenBy
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QSortThenBy> {
  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByBillingDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingDay', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByBillingDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingDay', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByLogoEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoEmoji', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByLogoEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoEmoji', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByManageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageUrl', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByManageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageUrl', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByMonthlyCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyCost', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByMonthlyCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyCost', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByNextBillingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBillingDate', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByNextBillingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBillingDate', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SubscriptionItemQueryWhereDistinct
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct> {
  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct>
      distinctByBillingDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billingDay');
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct>
      distinctByLogoEmoji({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoEmoji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct>
      distinctByManageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct>
      distinctByMonthlyCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyCost');
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct>
      distinctByNextBillingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextBillingDate');
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionItem, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension SubscriptionItemQueryProperty
    on QueryBuilder<SubscriptionItem, SubscriptionItem, QQueryProperty> {
  QueryBuilder<SubscriptionItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SubscriptionItem, int, QQueryOperations> billingDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billingDay');
    });
  }

  QueryBuilder<SubscriptionItem, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SubscriptionItem, String, QQueryOperations> logoEmojiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoEmoji');
    });
  }

  QueryBuilder<SubscriptionItem, String, QQueryOperations> manageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manageUrl');
    });
  }

  QueryBuilder<SubscriptionItem, int, QQueryOperations> monthlyCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyCost');
    });
  }

  QueryBuilder<SubscriptionItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SubscriptionItem, DateTime, QQueryOperations>
      nextBillingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextBillingDate');
    });
  }

  QueryBuilder<SubscriptionItem, SubscriptionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
