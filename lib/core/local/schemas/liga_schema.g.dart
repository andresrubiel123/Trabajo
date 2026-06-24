// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liga_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLigaSchemaCollection on Isar {
  IsarCollection<LigaSchema> get ligaSchemas => this.collection();
}

const LigaSchemaSchema = CollectionSchema(
  name: r'LigaSchema',
  id: -38694530044391138,
  properties: {
    r'banderaUrl': PropertySchema(
      id: 0,
      name: r'banderaUrl',
      type: IsarType.string,
    ),
    r'externalId': PropertySchema(
      id: 1,
      name: r'externalId',
      type: IsarType.long,
    ),
    r'logoUrl': PropertySchema(
      id: 2,
      name: r'logoUrl',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 3,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'pais': PropertySchema(
      id: 4,
      name: r'pais',
      type: IsarType.string,
    ),
    r'temporada': PropertySchema(
      id: 5,
      name: r'temporada',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _ligaSchemaEstimateSize,
  serialize: _ligaSchemaSerialize,
  deserialize: _ligaSchemaDeserialize,
  deserializeProp: _ligaSchemaDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'externalId': IndexSchema(
      id: 8629824136592255998,
      name: r'externalId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'externalId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ligaSchemaGetId,
  getLinks: _ligaSchemaGetLinks,
  attach: _ligaSchemaAttach,
  version: '3.1.0+1',
);

int _ligaSchemaEstimateSize(
  LigaSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.banderaUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.pais.length * 3;
  return bytesCount;
}

void _ligaSchemaSerialize(
  LigaSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.banderaUrl);
  writer.writeLong(offsets[1], object.externalId);
  writer.writeString(offsets[2], object.logoUrl);
  writer.writeString(offsets[3], object.nombre);
  writer.writeString(offsets[4], object.pais);
  writer.writeLong(offsets[5], object.temporada);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

LigaSchema _ligaSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LigaSchema();
  object.banderaUrl = reader.readStringOrNull(offsets[0]);
  object.externalId = reader.readLong(offsets[1]);
  object.isarId = id;
  object.logoUrl = reader.readStringOrNull(offsets[2]);
  object.nombre = reader.readString(offsets[3]);
  object.pais = reader.readString(offsets[4]);
  object.temporada = reader.readLongOrNull(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  return object;
}

P _ligaSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ligaSchemaGetId(LigaSchema object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _ligaSchemaGetLinks(LigaSchema object) {
  return [];
}

void _ligaSchemaAttach(IsarCollection<dynamic> col, Id id, LigaSchema object) {
  object.isarId = id;
}

extension LigaSchemaByIndex on IsarCollection<LigaSchema> {
  Future<LigaSchema?> getByExternalId(int externalId) {
    return getByIndex(r'externalId', [externalId]);
  }

  LigaSchema? getByExternalIdSync(int externalId) {
    return getByIndexSync(r'externalId', [externalId]);
  }

  Future<bool> deleteByExternalId(int externalId) {
    return deleteByIndex(r'externalId', [externalId]);
  }

  bool deleteByExternalIdSync(int externalId) {
    return deleteByIndexSync(r'externalId', [externalId]);
  }

  Future<List<LigaSchema?>> getAllByExternalId(List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'externalId', values);
  }

  List<LigaSchema?> getAllByExternalIdSync(List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'externalId', values);
  }

  Future<int> deleteAllByExternalId(List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'externalId', values);
  }

  int deleteAllByExternalIdSync(List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'externalId', values);
  }

  Future<Id> putByExternalId(LigaSchema object) {
    return putByIndex(r'externalId', object);
  }

  Id putByExternalIdSync(LigaSchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'externalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExternalId(List<LigaSchema> objects) {
    return putAllByIndex(r'externalId', objects);
  }

  List<Id> putAllByExternalIdSync(List<LigaSchema> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'externalId', objects, saveLinks: saveLinks);
  }
}

extension LigaSchemaQueryWhereSort
    on QueryBuilder<LigaSchema, LigaSchema, QWhere> {
  QueryBuilder<LigaSchema, LigaSchema, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhere> anyExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'externalId'),
      );
    });
  }
}

extension LigaSchemaQueryWhere
    on QueryBuilder<LigaSchema, LigaSchema, QWhereClause> {
  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> externalIdEqualTo(
      int externalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [externalId],
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> externalIdNotEqualTo(
      int externalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [],
              upper: [externalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [externalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [externalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [],
              upper: [externalId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> externalIdGreaterThan(
    int externalId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'externalId',
        lower: [externalId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> externalIdLessThan(
    int externalId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'externalId',
        lower: [],
        upper: [externalId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterWhereClause> externalIdBetween(
    int lowerExternalId,
    int upperExternalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'externalId',
        lower: [lowerExternalId],
        includeLower: includeLower,
        upper: [upperExternalId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LigaSchemaQueryFilter
    on QueryBuilder<LigaSchema, LigaSchema, QFilterCondition> {
  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banderaUrl',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banderaUrl',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> banderaUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> banderaUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banderaUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> banderaUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banderaUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      banderaUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banderaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> externalIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      externalIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'externalId',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      externalIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'externalId',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> externalIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'externalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logoUrl',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      logoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logoUrl',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      logoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> logoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      logoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pais',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pais',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pais',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> paisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pais',
        value: '',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      temporadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temporada',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      temporadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temporada',
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> temporadaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temporada',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      temporadaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temporada',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> temporadaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temporada',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> temporadaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temporada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LigaSchemaQueryObject
    on QueryBuilder<LigaSchema, LigaSchema, QFilterCondition> {}

extension LigaSchemaQueryLinks
    on QueryBuilder<LigaSchema, LigaSchema, QFilterCondition> {}

extension LigaSchemaQuerySortBy
    on QueryBuilder<LigaSchema, LigaSchema, QSortBy> {
  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByBanderaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByBanderaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByLogoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByLogoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByPais() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByPaisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByTemporada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temporada', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByTemporadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temporada', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LigaSchemaQuerySortThenBy
    on QueryBuilder<LigaSchema, LigaSchema, QSortThenBy> {
  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByBanderaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByBanderaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByLogoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByLogoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByPais() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByPaisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByTemporada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temporada', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByTemporadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temporada', Sort.desc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LigaSchemaQueryWhereDistinct
    on QueryBuilder<LigaSchema, LigaSchema, QDistinct> {
  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByBanderaUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banderaUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId');
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByLogoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByPais(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pais', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByTemporada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temporada');
    });
  }

  QueryBuilder<LigaSchema, LigaSchema, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LigaSchemaQueryProperty
    on QueryBuilder<LigaSchema, LigaSchema, QQueryProperty> {
  QueryBuilder<LigaSchema, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<LigaSchema, String?, QQueryOperations> banderaUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banderaUrl');
    });
  }

  QueryBuilder<LigaSchema, int, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<LigaSchema, String?, QQueryOperations> logoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoUrl');
    });
  }

  QueryBuilder<LigaSchema, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<LigaSchema, String, QQueryOperations> paisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pais');
    });
  }

  QueryBuilder<LigaSchema, int?, QQueryOperations> temporadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temporada');
    });
  }

  QueryBuilder<LigaSchema, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
