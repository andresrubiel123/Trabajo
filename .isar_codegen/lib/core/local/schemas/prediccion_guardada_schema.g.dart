// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediccion_guardada_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrediccionGuardadaSchemaCollection on Isar {
  IsarCollection<PrediccionGuardadaSchema> get prediccionGuardadaSchemas =>
      this.collection();
}

const PrediccionGuardadaSchemaSchema = CollectionSchema(
  name: r'PrediccionGuardadaSchema',
  id: 8920863212279481998,
  properties: {
    r'confianza': PropertySchema(
      id: 0,
      name: r'confianza',
      type: IsarType.long,
    ),
    r'equipoLocalNombre': PropertySchema(
      id: 1,
      name: r'equipoLocalNombre',
      type: IsarType.string,
    ),
    r'equipoVisitanteNombre': PropertySchema(
      id: 2,
      name: r'equipoVisitanteNombre',
      type: IsarType.string,
    ),
    r'escudoLocalUrl': PropertySchema(
      id: 3,
      name: r'escudoLocalUrl',
      type: IsarType.string,
    ),
    r'escudoVisitanteUrl': PropertySchema(
      id: 4,
      name: r'escudoVisitanteUrl',
      type: IsarType.string,
    ),
    r'expiraEn': PropertySchema(
      id: 5,
      name: r'expiraEn',
      type: IsarType.dateTime,
    ),
    r'fixtureId': PropertySchema(
      id: 6,
      name: r'fixtureId',
      type: IsarType.long,
    ),
    r'guardadaEn': PropertySchema(
      id: 7,
      name: r'guardadaEn',
      type: IsarType.dateTime,
    ),
    r'ligaNombre': PropertySchema(
      id: 8,
      name: r'ligaNombre',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(
      id: 9,
      name: r'notas',
      type: IsarType.string,
    ),
    r'pick': PropertySchema(
      id: 10,
      name: r'pick',
      type: IsarType.string,
    )
  },
  estimateSize: _prediccionGuardadaSchemaEstimateSize,
  serialize: _prediccionGuardadaSchemaSerialize,
  deserialize: _prediccionGuardadaSchemaDeserialize,
  deserializeProp: _prediccionGuardadaSchemaDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'fixtureId': IndexSchema(
      id: -6003387217180047955,
      name: r'fixtureId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fixtureId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'expiraEn': IndexSchema(
      id: -4286193297484217861,
      name: r'expiraEn',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'expiraEn',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _prediccionGuardadaSchemaGetId,
  getLinks: _prediccionGuardadaSchemaGetLinks,
  attach: _prediccionGuardadaSchemaAttach,
  version: '3.1.0+1',
);

int _prediccionGuardadaSchemaEstimateSize(
  PrediccionGuardadaSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.equipoLocalNombre.length * 3;
  bytesCount += 3 + object.equipoVisitanteNombre.length * 3;
  {
    final value = object.escudoLocalUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.escudoVisitanteUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ligaNombre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.pick.length * 3;
  return bytesCount;
}

void _prediccionGuardadaSchemaSerialize(
  PrediccionGuardadaSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.confianza);
  writer.writeString(offsets[1], object.equipoLocalNombre);
  writer.writeString(offsets[2], object.equipoVisitanteNombre);
  writer.writeString(offsets[3], object.escudoLocalUrl);
  writer.writeString(offsets[4], object.escudoVisitanteUrl);
  writer.writeDateTime(offsets[5], object.expiraEn);
  writer.writeLong(offsets[6], object.fixtureId);
  writer.writeDateTime(offsets[7], object.guardadaEn);
  writer.writeString(offsets[8], object.ligaNombre);
  writer.writeString(offsets[9], object.notas);
  writer.writeString(offsets[10], object.pick);
}

PrediccionGuardadaSchema _prediccionGuardadaSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrediccionGuardadaSchema();
  object.confianza = reader.readLong(offsets[0]);
  object.equipoLocalNombre = reader.readString(offsets[1]);
  object.equipoVisitanteNombre = reader.readString(offsets[2]);
  object.escudoLocalUrl = reader.readStringOrNull(offsets[3]);
  object.escudoVisitanteUrl = reader.readStringOrNull(offsets[4]);
  object.expiraEn = reader.readDateTime(offsets[5]);
  object.fixtureId = reader.readLong(offsets[6]);
  object.guardadaEn = reader.readDateTime(offsets[7]);
  object.isarId = id;
  object.ligaNombre = reader.readStringOrNull(offsets[8]);
  object.notas = reader.readStringOrNull(offsets[9]);
  object.pick = reader.readString(offsets[10]);
  return object;
}

P _prediccionGuardadaSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _prediccionGuardadaSchemaGetId(PrediccionGuardadaSchema object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _prediccionGuardadaSchemaGetLinks(
    PrediccionGuardadaSchema object) {
  return [];
}

void _prediccionGuardadaSchemaAttach(
    IsarCollection<dynamic> col, Id id, PrediccionGuardadaSchema object) {
  object.isarId = id;
}

extension PrediccionGuardadaSchemaQueryWhereSort on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QWhere> {
  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterWhere>
      anyFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fixtureId'),
      );
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterWhere>
      anyExpiraEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'expiraEn'),
      );
    });
  }
}

extension PrediccionGuardadaSchemaQueryWhere on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QWhereClause> {
  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> fixtureIdEqualTo(int fixtureId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fixtureId',
        value: [fixtureId],
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> fixtureIdNotEqualTo(int fixtureId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fixtureId',
              lower: [],
              upper: [fixtureId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fixtureId',
              lower: [fixtureId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fixtureId',
              lower: [fixtureId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fixtureId',
              lower: [],
              upper: [fixtureId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> fixtureIdGreaterThan(
    int fixtureId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fixtureId',
        lower: [fixtureId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> fixtureIdLessThan(
    int fixtureId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fixtureId',
        lower: [],
        upper: [fixtureId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> fixtureIdBetween(
    int lowerFixtureId,
    int upperFixtureId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fixtureId',
        lower: [lowerFixtureId],
        includeLower: includeLower,
        upper: [upperFixtureId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> expiraEnEqualTo(DateTime expiraEn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expiraEn',
        value: [expiraEn],
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> expiraEnNotEqualTo(DateTime expiraEn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiraEn',
              lower: [],
              upper: [expiraEn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiraEn',
              lower: [expiraEn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiraEn',
              lower: [expiraEn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiraEn',
              lower: [],
              upper: [expiraEn],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> expiraEnGreaterThan(
    DateTime expiraEn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiraEn',
        lower: [expiraEn],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> expiraEnLessThan(
    DateTime expiraEn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiraEn',
        lower: [],
        upper: [expiraEn],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterWhereClause> expiraEnBetween(
    DateTime lowerExpiraEn,
    DateTime upperExpiraEn, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiraEn',
        lower: [lowerExpiraEn],
        includeLower: includeLower,
        upper: [upperExpiraEn],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PrediccionGuardadaSchemaQueryFilter on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QFilterCondition> {
  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> confianzaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confianza',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> confianzaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confianza',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> confianzaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confianza',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> confianzaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confianza',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoLocalNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      equipoLocalNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      equipoLocalNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipoLocalNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoLocalNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoLocalNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipoLocalNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoVisitanteNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      equipoVisitanteNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      equipoVisitanteNombreMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipoVisitanteNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoVisitanteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> equipoVisitanteNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipoVisitanteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'escudoLocalUrl',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'escudoLocalUrl',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'escudoLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'escudoLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'escudoLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'escudoLocalUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'escudoLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'escudoLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      escudoLocalUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'escudoLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      escudoLocalUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'escudoLocalUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'escudoLocalUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoLocalUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'escudoLocalUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'escudoVisitanteUrl',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'escudoVisitanteUrl',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'escudoVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'escudoVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'escudoVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'escudoVisitanteUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'escudoVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'escudoVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      escudoVisitanteUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'escudoVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      escudoVisitanteUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'escudoVisitanteUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'escudoVisitanteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> escudoVisitanteUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'escudoVisitanteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> expiraEnEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiraEn',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> expiraEnGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiraEn',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> expiraEnLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiraEn',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> expiraEnBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiraEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> fixtureIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> fixtureIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> fixtureIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fixtureId',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> fixtureIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fixtureId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> guardadaEnEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guardadaEn',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> guardadaEnGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guardadaEn',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> guardadaEnLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guardadaEn',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> guardadaEnBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guardadaEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ligaNombre',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ligaNombre',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ligaNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ligaNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ligaNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ligaNombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ligaNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ligaNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      ligaNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ligaNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      ligaNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ligaNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ligaNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> ligaNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ligaNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      notasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      notasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pick',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pick',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pick',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pick',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pick',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pick',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      pickContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pick',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
          QAfterFilterCondition>
      pickMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pick',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pick',
        value: '',
      ));
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema,
      QAfterFilterCondition> pickIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pick',
        value: '',
      ));
    });
  }
}

extension PrediccionGuardadaSchemaQueryObject on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QFilterCondition> {}

extension PrediccionGuardadaSchemaQueryLinks on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QFilterCondition> {}

extension PrediccionGuardadaSchemaQuerySortBy on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QSortBy> {
  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByConfianza() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confianza', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByConfianzaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confianza', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEquipoLocalNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEquipoLocalNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEquipoVisitanteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEquipoVisitanteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEscudoLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoLocalUrl', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEscudoLocalUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoLocalUrl', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEscudoVisitanteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoVisitanteUrl', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByEscudoVisitanteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoVisitanteUrl', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByExpiraEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiraEn', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByExpiraEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiraEn', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByFixtureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByGuardadaEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardadaEn', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByGuardadaEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardadaEn', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByLigaNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaNombre', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByLigaNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaNombre', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByPick() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pick', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      sortByPickDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pick', Sort.desc);
    });
  }
}

extension PrediccionGuardadaSchemaQuerySortThenBy on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QSortThenBy> {
  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByConfianza() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confianza', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByConfianzaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confianza', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEquipoLocalNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEquipoLocalNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEquipoVisitanteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEquipoVisitanteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEscudoLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoLocalUrl', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEscudoLocalUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoLocalUrl', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEscudoVisitanteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoVisitanteUrl', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByEscudoVisitanteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoVisitanteUrl', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByExpiraEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiraEn', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByExpiraEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiraEn', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByFixtureIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fixtureId', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByGuardadaEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardadaEn', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByGuardadaEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardadaEn', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByLigaNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaNombre', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByLigaNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaNombre', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByPick() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pick', Sort.asc);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QAfterSortBy>
      thenByPickDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pick', Sort.desc);
    });
  }
}

extension PrediccionGuardadaSchemaQueryWhereDistinct on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct> {
  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByConfianza() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confianza');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByEquipoLocalNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoLocalNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByEquipoVisitanteNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoVisitanteNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByEscudoLocalUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'escudoLocalUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByEscudoVisitanteUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'escudoVisitanteUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByExpiraEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiraEn');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByFixtureId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fixtureId');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByGuardadaEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guardadaEn');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByLigaNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ligaNombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByNotas({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, PrediccionGuardadaSchema, QDistinct>
      distinctByPick({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pick', caseSensitive: caseSensitive);
    });
  }
}

extension PrediccionGuardadaSchemaQueryProperty on QueryBuilder<
    PrediccionGuardadaSchema, PrediccionGuardadaSchema, QQueryProperty> {
  QueryBuilder<PrediccionGuardadaSchema, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, int, QQueryOperations>
      confianzaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confianza');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String, QQueryOperations>
      equipoLocalNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoLocalNombre');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String, QQueryOperations>
      equipoVisitanteNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoVisitanteNombre');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String?, QQueryOperations>
      escudoLocalUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'escudoLocalUrl');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String?, QQueryOperations>
      escudoVisitanteUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'escudoVisitanteUrl');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, DateTime, QQueryOperations>
      expiraEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiraEn');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, int, QQueryOperations>
      fixtureIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fixtureId');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, DateTime, QQueryOperations>
      guardadaEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guardadaEn');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String?, QQueryOperations>
      ligaNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ligaNombre');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String?, QQueryOperations>
      notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<PrediccionGuardadaSchema, String, QQueryOperations>
      pickProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pick');
    });
  }
}
