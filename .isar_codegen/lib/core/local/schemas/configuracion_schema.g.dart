// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetConfiguracionSchemaCollection on Isar {
  IsarCollection<ConfiguracionSchema> get configuracionSchemas =>
      this.collection();
}

const ConfiguracionSchemaSchema = CollectionSchema(
  name: r'ConfiguracionSchema',
  id: 4783700620912397815,
  properties: {
    r'idioma': PropertySchema(
      id: 0,
      name: r'idioma',
      type: IsarType.string,
    ),
    r'lastSyncTimestamp': PropertySchema(
      id: 1,
      name: r'lastSyncTimestamp',
      type: IsarType.dateTime,
    ),
    r'ligasFavoritasIds': PropertySchema(
      id: 2,
      name: r'ligasFavoritasIds',
      type: IsarType.longList,
    ),
    r'notificacionesActivas': PropertySchema(
      id: 3,
      name: r'notificacionesActivas',
      type: IsarType.bool,
    ),
    r'seedVersion': PropertySchema(
      id: 4,
      name: r'seedVersion',
      type: IsarType.long,
    ),
    r'temaOscuro': PropertySchema(
      id: 5,
      name: r'temaOscuro',
      type: IsarType.bool,
    )
  },
  estimateSize: _configuracionSchemaEstimateSize,
  serialize: _configuracionSchemaSerialize,
  deserialize: _configuracionSchemaDeserialize,
  deserializeProp: _configuracionSchemaDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _configuracionSchemaGetId,
  getLinks: _configuracionSchemaGetLinks,
  attach: _configuracionSchemaAttach,
  version: '3.1.0+1',
);

int _configuracionSchemaEstimateSize(
  ConfiguracionSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idioma.length * 3;
  bytesCount += 3 + object.ligasFavoritasIds.length * 8;
  return bytesCount;
}

void _configuracionSchemaSerialize(
  ConfiguracionSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.idioma);
  writer.writeDateTime(offsets[1], object.lastSyncTimestamp);
  writer.writeLongList(offsets[2], object.ligasFavoritasIds);
  writer.writeBool(offsets[3], object.notificacionesActivas);
  writer.writeLong(offsets[4], object.seedVersion);
  writer.writeBool(offsets[5], object.temaOscuro);
}

ConfiguracionSchema _configuracionSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ConfiguracionSchema();
  object.idioma = reader.readString(offsets[0]);
  object.isarId = id;
  object.lastSyncTimestamp = reader.readDateTimeOrNull(offsets[1]);
  object.ligasFavoritasIds = reader.readLongList(offsets[2]) ?? [];
  object.notificacionesActivas = reader.readBool(offsets[3]);
  object.seedVersion = reader.readLong(offsets[4]);
  object.temaOscuro = reader.readBool(offsets[5]);
  return object;
}

P _configuracionSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _configuracionSchemaGetId(ConfiguracionSchema object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _configuracionSchemaGetLinks(
    ConfiguracionSchema object) {
  return [];
}

void _configuracionSchemaAttach(
    IsarCollection<dynamic> col, Id id, ConfiguracionSchema object) {
  object.isarId = id;
}

extension ConfiguracionSchemaQueryWhereSort
    on QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QWhere> {
  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ConfiguracionSchemaQueryWhere
    on QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QWhereClause> {
  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterWhereClause>
      isarIdBetween(
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
}

extension ConfiguracionSchemaQueryFilter on QueryBuilder<ConfiguracionSchema,
    ConfiguracionSchema, QFilterCondition> {
  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idioma',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idioma',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idioma',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idioma',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idioma',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idioma',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idioma',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idioma',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idioma',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      idiomaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idioma',
        value: '',
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      isarIdGreaterThan(
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

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      isarIdLessThan(
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

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      isarIdBetween(
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

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      lastSyncTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncTimestamp',
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      lastSyncTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncTimestamp',
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      lastSyncTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      lastSyncTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      lastSyncTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      lastSyncTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ligasFavoritasIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ligasFavoritasIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ligasFavoritasIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ligasFavoritasIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ligasFavoritasIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ligasFavoritasIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ligasFavoritasIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ligasFavoritasIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ligasFavoritasIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      ligasFavoritasIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ligasFavoritasIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      notificacionesActivasEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificacionesActivas',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      seedVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seedVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      seedVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seedVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      seedVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seedVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      seedVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seedVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterFilterCondition>
      temaOscuroEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temaOscuro',
        value: value,
      ));
    });
  }
}

extension ConfiguracionSchemaQueryObject on QueryBuilder<ConfiguracionSchema,
    ConfiguracionSchema, QFilterCondition> {}

extension ConfiguracionSchemaQueryLinks on QueryBuilder<ConfiguracionSchema,
    ConfiguracionSchema, QFilterCondition> {}

extension ConfiguracionSchemaQuerySortBy
    on QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QSortBy> {
  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByIdioma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByIdiomaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByLastSyncTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByNotificacionesActivas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesActivas', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByNotificacionesActivasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesActivas', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortBySeedVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedVersion', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortBySeedVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedVersion', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByTemaOscuro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temaOscuro', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      sortByTemaOscuroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temaOscuro', Sort.desc);
    });
  }
}

extension ConfiguracionSchemaQuerySortThenBy
    on QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QSortThenBy> {
  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByIdioma() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByIdiomaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idioma', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByLastSyncTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByNotificacionesActivas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesActivas', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByNotificacionesActivasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesActivas', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenBySeedVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedVersion', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenBySeedVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedVersion', Sort.desc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByTemaOscuro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temaOscuro', Sort.asc);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QAfterSortBy>
      thenByTemaOscuroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temaOscuro', Sort.desc);
    });
  }
}

extension ConfiguracionSchemaQueryWhereDistinct
    on QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct> {
  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct>
      distinctByIdioma({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idioma', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct>
      distinctByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncTimestamp');
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct>
      distinctByLigasFavoritasIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ligasFavoritasIds');
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct>
      distinctByNotificacionesActivas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificacionesActivas');
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct>
      distinctBySeedVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seedVersion');
    });
  }

  QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QDistinct>
      distinctByTemaOscuro() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temaOscuro');
    });
  }
}

extension ConfiguracionSchemaQueryProperty
    on QueryBuilder<ConfiguracionSchema, ConfiguracionSchema, QQueryProperty> {
  QueryBuilder<ConfiguracionSchema, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ConfiguracionSchema, String, QQueryOperations> idiomaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idioma');
    });
  }

  QueryBuilder<ConfiguracionSchema, DateTime?, QQueryOperations>
      lastSyncTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncTimestamp');
    });
  }

  QueryBuilder<ConfiguracionSchema, List<int>, QQueryOperations>
      ligasFavoritasIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ligasFavoritasIds');
    });
  }

  QueryBuilder<ConfiguracionSchema, bool, QQueryOperations>
      notificacionesActivasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificacionesActivas');
    });
  }

  QueryBuilder<ConfiguracionSchema, int, QQueryOperations>
      seedVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seedVersion');
    });
  }

  QueryBuilder<ConfiguracionSchema, bool, QQueryOperations>
      temaOscuroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temaOscuro');
    });
  }
}
