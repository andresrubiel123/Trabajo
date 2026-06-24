// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jugador_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJugadorSchemaCollection on Isar {
  IsarCollection<JugadorSchema> get jugadorSchemas => this.collection();
}

const JugadorSchemaSchema = CollectionSchema(
  name: r'JugadorSchema',
  id: -439094452504156596,
  properties: {
    r'apellido': PropertySchema(
      id: 0,
      name: r'apellido',
      type: IsarType.string,
    ),
    r'banderaNacionalidadUrl': PropertySchema(
      id: 1,
      name: r'banderaNacionalidadUrl',
      type: IsarType.string,
    ),
    r'equipoId': PropertySchema(
      id: 2,
      name: r'equipoId',
      type: IsarType.long,
    ),
    r'externalId': PropertySchema(
      id: 3,
      name: r'externalId',
      type: IsarType.long,
    ),
    r'fotoUrl': PropertySchema(
      id: 4,
      name: r'fotoUrl',
      type: IsarType.string,
    ),
    r'nacionalidad': PropertySchema(
      id: 5,
      name: r'nacionalidad',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 6,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'posicion': PropertySchema(
      id: 7,
      name: r'posicion',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _jugadorSchemaEstimateSize,
  serialize: _jugadorSchemaSerialize,
  deserialize: _jugadorSchemaDeserialize,
  deserializeProp: _jugadorSchemaDeserializeProp,
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
    ),
    r'equipoId': IndexSchema(
      id: 2095026534953675866,
      name: r'equipoId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'equipoId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _jugadorSchemaGetId,
  getLinks: _jugadorSchemaGetLinks,
  attach: _jugadorSchemaAttach,
  version: '3.1.0+1',
);

int _jugadorSchemaEstimateSize(
  JugadorSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apellido.length * 3;
  {
    final value = object.banderaNacionalidadUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fotoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nacionalidad.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.posicion.length * 3;
  return bytesCount;
}

void _jugadorSchemaSerialize(
  JugadorSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apellido);
  writer.writeString(offsets[1], object.banderaNacionalidadUrl);
  writer.writeLong(offsets[2], object.equipoId);
  writer.writeLong(offsets[3], object.externalId);
  writer.writeString(offsets[4], object.fotoUrl);
  writer.writeString(offsets[5], object.nacionalidad);
  writer.writeString(offsets[6], object.nombre);
  writer.writeString(offsets[7], object.posicion);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

JugadorSchema _jugadorSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JugadorSchema();
  object.apellido = reader.readString(offsets[0]);
  object.banderaNacionalidadUrl = reader.readStringOrNull(offsets[1]);
  object.equipoId = reader.readLong(offsets[2]);
  object.externalId = reader.readLong(offsets[3]);
  object.fotoUrl = reader.readStringOrNull(offsets[4]);
  object.isarId = id;
  object.nacionalidad = reader.readString(offsets[5]);
  object.nombre = reader.readString(offsets[6]);
  object.posicion = reader.readString(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  return object;
}

P _jugadorSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jugadorSchemaGetId(JugadorSchema object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _jugadorSchemaGetLinks(JugadorSchema object) {
  return [];
}

void _jugadorSchemaAttach(
    IsarCollection<dynamic> col, Id id, JugadorSchema object) {
  object.isarId = id;
}

extension JugadorSchemaByIndex on IsarCollection<JugadorSchema> {
  Future<JugadorSchema?> getByExternalId(int externalId) {
    return getByIndex(r'externalId', [externalId]);
  }

  JugadorSchema? getByExternalIdSync(int externalId) {
    return getByIndexSync(r'externalId', [externalId]);
  }

  Future<bool> deleteByExternalId(int externalId) {
    return deleteByIndex(r'externalId', [externalId]);
  }

  bool deleteByExternalIdSync(int externalId) {
    return deleteByIndexSync(r'externalId', [externalId]);
  }

  Future<List<JugadorSchema?>> getAllByExternalId(List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'externalId', values);
  }

  List<JugadorSchema?> getAllByExternalIdSync(List<int> externalIdValues) {
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

  Future<Id> putByExternalId(JugadorSchema object) {
    return putByIndex(r'externalId', object);
  }

  Id putByExternalIdSync(JugadorSchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'externalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExternalId(List<JugadorSchema> objects) {
    return putAllByIndex(r'externalId', objects);
  }

  List<Id> putAllByExternalIdSync(List<JugadorSchema> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'externalId', objects, saveLinks: saveLinks);
  }
}

extension JugadorSchemaQueryWhereSort
    on QueryBuilder<JugadorSchema, JugadorSchema, QWhere> {
  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhere> anyExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'externalId'),
      );
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhere> anyEquipoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'equipoId'),
      );
    });
  }
}

extension JugadorSchemaQueryWhere
    on QueryBuilder<JugadorSchema, JugadorSchema, QWhereClause> {
  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      externalIdEqualTo(int externalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [externalId],
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      externalIdNotEqualTo(int externalId) {
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      externalIdGreaterThan(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      externalIdLessThan(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      externalIdBetween(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause> equipoIdEqualTo(
      int equipoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'equipoId',
        value: [equipoId],
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      equipoIdNotEqualTo(int equipoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equipoId',
              lower: [],
              upper: [equipoId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equipoId',
              lower: [equipoId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equipoId',
              lower: [equipoId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equipoId',
              lower: [],
              upper: [equipoId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      equipoIdGreaterThan(
    int equipoId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'equipoId',
        lower: [equipoId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause>
      equipoIdLessThan(
    int equipoId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'equipoId',
        lower: [],
        upper: [equipoId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterWhereClause> equipoIdBetween(
    int lowerEquipoId,
    int upperEquipoId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'equipoId',
        lower: [lowerEquipoId],
        includeLower: includeLower,
        upper: [upperEquipoId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JugadorSchemaQueryFilter
    on QueryBuilder<JugadorSchema, JugadorSchema, QFilterCondition> {
  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apellido',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apellido',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellido',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      apellidoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apellido',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banderaNacionalidadUrl',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banderaNacionalidadUrl',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaNacionalidadUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banderaNacionalidadUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banderaNacionalidadUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banderaNacionalidadUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banderaNacionalidadUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banderaNacionalidadUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banderaNacionalidadUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banderaNacionalidadUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaNacionalidadUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      banderaNacionalidadUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banderaNacionalidadUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      equipoIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoId',
        value: value,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      equipoIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoId',
        value: value,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      equipoIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoId',
        value: value,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      equipoIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      externalIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: value,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      externalIdBetween(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fotoUrl',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fotoUrl',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fotoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fotoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      fotoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nacionalidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nacionalidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nacionalidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nacionalidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nacionalidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nacionalidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nacionalidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nacionalidad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nacionalidad',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nacionalidadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nacionalidad',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreEqualTo(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreGreaterThan(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreLessThan(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreBetween(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreStartsWith(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreEndsWith(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posicion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'posicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'posicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'posicion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'posicion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posicion',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      posicionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'posicion',
        value: '',
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterFilterCondition>
      updatedAtBetween(
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

extension JugadorSchemaQueryObject
    on QueryBuilder<JugadorSchema, JugadorSchema, QFilterCondition> {}

extension JugadorSchemaQueryLinks
    on QueryBuilder<JugadorSchema, JugadorSchema, QFilterCondition> {}

extension JugadorSchemaQuerySortBy
    on QueryBuilder<JugadorSchema, JugadorSchema, QSortBy> {
  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByApellido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByApellidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByBanderaNacionalidadUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaNacionalidadUrl', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByBanderaNacionalidadUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaNacionalidadUrl', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByEquipoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoId', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByEquipoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoId', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByFotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByFotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByNacionalidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nacionalidad', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByNacionalidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nacionalidad', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByPosicion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posicion', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByPosicionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posicion', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension JugadorSchemaQuerySortThenBy
    on QueryBuilder<JugadorSchema, JugadorSchema, QSortThenBy> {
  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByApellido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByApellidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByBanderaNacionalidadUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaNacionalidadUrl', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByBanderaNacionalidadUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaNacionalidadUrl', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByEquipoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoId', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByEquipoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoId', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByFotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByFotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByNacionalidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nacionalidad', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByNacionalidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nacionalidad', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByPosicion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posicion', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByPosicionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posicion', Sort.desc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension JugadorSchemaQueryWhereDistinct
    on QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> {
  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByApellido(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apellido', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct>
      distinctByBanderaNacionalidadUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banderaNacionalidadUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByEquipoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoId');
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId');
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByFotoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByNacionalidad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nacionalidad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByPosicion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posicion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JugadorSchema, JugadorSchema, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension JugadorSchemaQueryProperty
    on QueryBuilder<JugadorSchema, JugadorSchema, QQueryProperty> {
  QueryBuilder<JugadorSchema, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<JugadorSchema, String, QQueryOperations> apellidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apellido');
    });
  }

  QueryBuilder<JugadorSchema, String?, QQueryOperations>
      banderaNacionalidadUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banderaNacionalidadUrl');
    });
  }

  QueryBuilder<JugadorSchema, int, QQueryOperations> equipoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoId');
    });
  }

  QueryBuilder<JugadorSchema, int, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<JugadorSchema, String?, QQueryOperations> fotoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotoUrl');
    });
  }

  QueryBuilder<JugadorSchema, String, QQueryOperations> nacionalidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nacionalidad');
    });
  }

  QueryBuilder<JugadorSchema, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<JugadorSchema, String, QQueryOperations> posicionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posicion');
    });
  }

  QueryBuilder<JugadorSchema, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
