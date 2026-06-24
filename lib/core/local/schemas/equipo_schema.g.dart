// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipo_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEquipoSchemaCollection on Isar {
  IsarCollection<EquipoSchema> get equipoSchemas => this.collection();
}

const EquipoSchemaSchema = CollectionSchema(
  name: r'EquipoSchema',
  id: 2497994855884159205,
  properties: {
    r'banderaUrl': PropertySchema(
      id: 0,
      name: r'banderaUrl',
      type: IsarType.string,
    ),
    r'codigoPais': PropertySchema(
      id: 1,
      name: r'codigoPais',
      type: IsarType.string,
    ),
    r'esSeleccionMundial': PropertySchema(
      id: 2,
      name: r'esSeleccionMundial',
      type: IsarType.bool,
    ),
    r'escudoUrl': PropertySchema(
      id: 3,
      name: r'escudoUrl',
      type: IsarType.string,
    ),
    r'externalId': PropertySchema(
      id: 4,
      name: r'externalId',
      type: IsarType.long,
    ),
    r'grupoCopaMundo': PropertySchema(
      id: 5,
      name: r'grupoCopaMundo',
      type: IsarType.string,
    ),
    r'ligaId': PropertySchema(
      id: 6,
      name: r'ligaId',
      type: IsarType.long,
    ),
    r'nombre': PropertySchema(
      id: 7,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'pais': PropertySchema(
      id: 8,
      name: r'pais',
      type: IsarType.string,
    ),
    r'paisBanderaUrl': PropertySchema(
      id: 9,
      name: r'paisBanderaUrl',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _equipoSchemaEstimateSize,
  serialize: _equipoSchemaSerialize,
  deserialize: _equipoSchemaDeserialize,
  deserializeProp: _equipoSchemaDeserializeProp,
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
    r'nombre': IndexSchema(
      id: -8239814765453414572,
      name: r'nombre',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nombre',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'ligaId': IndexSchema(
      id: -2161498166029395607,
      name: r'ligaId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ligaId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'esSeleccionMundial': IndexSchema(
      id: 7683445003337964532,
      name: r'esSeleccionMundial',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'esSeleccionMundial',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _equipoSchemaGetId,
  getLinks: _equipoSchemaGetLinks,
  attach: _equipoSchemaAttach,
  version: '3.1.0+1',
);

int _equipoSchemaEstimateSize(
  EquipoSchema object,
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
    final value = object.codigoPais;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.escudoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.grupoCopaMundo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.pais.length * 3;
  {
    final value = object.paisBanderaUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _equipoSchemaSerialize(
  EquipoSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.banderaUrl);
  writer.writeString(offsets[1], object.codigoPais);
  writer.writeBool(offsets[2], object.esSeleccionMundial);
  writer.writeString(offsets[3], object.escudoUrl);
  writer.writeLong(offsets[4], object.externalId);
  writer.writeString(offsets[5], object.grupoCopaMundo);
  writer.writeLong(offsets[6], object.ligaId);
  writer.writeString(offsets[7], object.nombre);
  writer.writeString(offsets[8], object.pais);
  writer.writeString(offsets[9], object.paisBanderaUrl);
  writer.writeDateTime(offsets[10], object.updatedAt);
}

EquipoSchema _equipoSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EquipoSchema();
  object.banderaUrl = reader.readStringOrNull(offsets[0]);
  object.codigoPais = reader.readStringOrNull(offsets[1]);
  object.esSeleccionMundial = reader.readBool(offsets[2]);
  object.escudoUrl = reader.readStringOrNull(offsets[3]);
  object.externalId = reader.readLong(offsets[4]);
  object.grupoCopaMundo = reader.readStringOrNull(offsets[5]);
  object.isarId = id;
  object.ligaId = reader.readLong(offsets[6]);
  object.nombre = reader.readString(offsets[7]);
  object.pais = reader.readString(offsets[8]);
  object.paisBanderaUrl = reader.readStringOrNull(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  return object;
}

P _equipoSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _equipoSchemaGetId(EquipoSchema object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _equipoSchemaGetLinks(EquipoSchema object) {
  return [];
}

void _equipoSchemaAttach(
    IsarCollection<dynamic> col, Id id, EquipoSchema object) {
  object.isarId = id;
}

extension EquipoSchemaByIndex on IsarCollection<EquipoSchema> {
  Future<EquipoSchema?> getByExternalId(int externalId) {
    return getByIndex(r'externalId', [externalId]);
  }

  EquipoSchema? getByExternalIdSync(int externalId) {
    return getByIndexSync(r'externalId', [externalId]);
  }

  Future<bool> deleteByExternalId(int externalId) {
    return deleteByIndex(r'externalId', [externalId]);
  }

  bool deleteByExternalIdSync(int externalId) {
    return deleteByIndexSync(r'externalId', [externalId]);
  }

  Future<List<EquipoSchema?>> getAllByExternalId(List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'externalId', values);
  }

  List<EquipoSchema?> getAllByExternalIdSync(List<int> externalIdValues) {
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

  Future<Id> putByExternalId(EquipoSchema object) {
    return putByIndex(r'externalId', object);
  }

  Id putByExternalIdSync(EquipoSchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'externalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExternalId(List<EquipoSchema> objects) {
    return putAllByIndex(r'externalId', objects);
  }

  List<Id> putAllByExternalIdSync(List<EquipoSchema> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'externalId', objects, saveLinks: saveLinks);
  }
}

extension EquipoSchemaQueryWhereSort
    on QueryBuilder<EquipoSchema, EquipoSchema, QWhere> {
  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhere> anyExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'externalId'),
      );
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhere> anyLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ligaId'),
      );
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhere>
      anyEsSeleccionMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'esSeleccionMundial'),
      );
    });
  }
}

extension EquipoSchemaQueryWhere
    on QueryBuilder<EquipoSchema, EquipoSchema, QWhereClause> {
  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> externalIdEqualTo(
      int externalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [externalId],
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> externalIdBetween(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> nombreEqualTo(
      String nombre) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nombre',
        value: [nombre],
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> nombreNotEqualTo(
      String nombre) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [],
              upper: [nombre],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [nombre],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [nombre],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nombre',
              lower: [],
              upper: [nombre],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> ligaIdEqualTo(
      int ligaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ligaId',
        value: [ligaId],
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> ligaIdNotEqualTo(
      int ligaId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ligaId',
              lower: [],
              upper: [ligaId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ligaId',
              lower: [ligaId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ligaId',
              lower: [ligaId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ligaId',
              lower: [],
              upper: [ligaId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> ligaIdGreaterThan(
    int ligaId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ligaId',
        lower: [ligaId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> ligaIdLessThan(
    int ligaId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ligaId',
        lower: [],
        upper: [ligaId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause> ligaIdBetween(
    int lowerLigaId,
    int upperLigaId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ligaId',
        lower: [lowerLigaId],
        includeLower: includeLower,
        upper: [upperLigaId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause>
      esSeleccionMundialEqualTo(bool esSeleccionMundial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'esSeleccionMundial',
        value: [esSeleccionMundial],
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterWhereClause>
      esSeleccionMundialNotEqualTo(bool esSeleccionMundial) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esSeleccionMundial',
              lower: [],
              upper: [esSeleccionMundial],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esSeleccionMundial',
              lower: [esSeleccionMundial],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esSeleccionMundial',
              lower: [esSeleccionMundial],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esSeleccionMundial',
              lower: [],
              upper: [esSeleccionMundial],
              includeUpper: false,
            ));
      }
    });
  }
}

extension EquipoSchemaQueryFilter
    on QueryBuilder<EquipoSchema, EquipoSchema, QFilterCondition> {
  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banderaUrl',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banderaUrl',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlEqualTo(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlBetween(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banderaUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      banderaUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banderaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codigoPais',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codigoPais',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoPais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigoPais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigoPais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigoPais',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigoPais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigoPais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigoPais',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigoPais',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoPais',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      codigoPaisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigoPais',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      esSeleccionMundialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esSeleccionMundial',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'escudoUrl',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'escudoUrl',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'escudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'escudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'escudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'escudoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'escudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'escudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'escudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'escudoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'escudoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      escudoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'escudoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      externalIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grupoCopaMundo',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grupoCopaMundo',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupoCopaMundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupoCopaMundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupoCopaMundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupoCopaMundo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupoCopaMundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupoCopaMundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupoCopaMundo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupoCopaMundo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupoCopaMundo',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      grupoCopaMundoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupoCopaMundo',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> ligaIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ligaId',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      ligaIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ligaId',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      ligaIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ligaId',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> ligaIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ligaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> nombreMatches(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> paisEqualTo(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisGreaterThan(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> paisLessThan(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> paisBetween(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisStartsWith(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> paisEndsWith(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> paisContains(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition> paisMatches(
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pais',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pais',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paisBanderaUrl',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paisBanderaUrl',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paisBanderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paisBanderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paisBanderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paisBanderaUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paisBanderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paisBanderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paisBanderaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paisBanderaUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paisBanderaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      paisBanderaUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paisBanderaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterFilterCondition>
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

extension EquipoSchemaQueryObject
    on QueryBuilder<EquipoSchema, EquipoSchema, QFilterCondition> {}

extension EquipoSchemaQueryLinks
    on QueryBuilder<EquipoSchema, EquipoSchema, QFilterCondition> {}

extension EquipoSchemaQuerySortBy
    on QueryBuilder<EquipoSchema, EquipoSchema, QSortBy> {
  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByBanderaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByBanderaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByCodigoPais() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPais', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByCodigoPaisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPais', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByEsSeleccionMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSeleccionMundial', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByEsSeleccionMundialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSeleccionMundial', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByEscudoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoUrl', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByEscudoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoUrl', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByGrupoCopaMundo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoCopaMundo', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByGrupoCopaMundoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoCopaMundo', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByLigaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByPais() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByPaisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByPaisBanderaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paisBanderaUrl', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      sortByPaisBanderaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paisBanderaUrl', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EquipoSchemaQuerySortThenBy
    on QueryBuilder<EquipoSchema, EquipoSchema, QSortThenBy> {
  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByBanderaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByBanderaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaUrl', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByCodigoPais() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPais', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByCodigoPaisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoPais', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByEsSeleccionMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSeleccionMundial', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByEsSeleccionMundialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSeleccionMundial', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByEscudoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoUrl', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByEscudoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'escudoUrl', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByGrupoCopaMundo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoCopaMundo', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByGrupoCopaMundoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoCopaMundo', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByLigaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByPais() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByPaisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pais', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByPaisBanderaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paisBanderaUrl', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy>
      thenByPaisBanderaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paisBanderaUrl', Sort.desc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EquipoSchemaQueryWhereDistinct
    on QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> {
  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByBanderaUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banderaUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByCodigoPais(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigoPais', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct>
      distinctByEsSeleccionMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esSeleccionMundial');
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByEscudoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'escudoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId');
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByGrupoCopaMundo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupoCopaMundo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ligaId');
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByPais(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pais', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByPaisBanderaUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paisBanderaUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EquipoSchema, EquipoSchema, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension EquipoSchemaQueryProperty
    on QueryBuilder<EquipoSchema, EquipoSchema, QQueryProperty> {
  QueryBuilder<EquipoSchema, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<EquipoSchema, String?, QQueryOperations> banderaUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banderaUrl');
    });
  }

  QueryBuilder<EquipoSchema, String?, QQueryOperations> codigoPaisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigoPais');
    });
  }

  QueryBuilder<EquipoSchema, bool, QQueryOperations>
      esSeleccionMundialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esSeleccionMundial');
    });
  }

  QueryBuilder<EquipoSchema, String?, QQueryOperations> escudoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'escudoUrl');
    });
  }

  QueryBuilder<EquipoSchema, int, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<EquipoSchema, String?, QQueryOperations>
      grupoCopaMundoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupoCopaMundo');
    });
  }

  QueryBuilder<EquipoSchema, int, QQueryOperations> ligaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ligaId');
    });
  }

  QueryBuilder<EquipoSchema, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<EquipoSchema, String, QQueryOperations> paisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pais');
    });
  }

  QueryBuilder<EquipoSchema, String?, QQueryOperations>
      paisBanderaUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paisBanderaUrl');
    });
  }

  QueryBuilder<EquipoSchema, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
