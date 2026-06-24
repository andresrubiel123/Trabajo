// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partido_local_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPartidoLocalSchemaCollection on Isar {
  IsarCollection<PartidoLocalSchema> get partidoLocalSchemas =>
      this.collection();
}

const PartidoLocalSchemaSchema = CollectionSchema(
  name: r'PartidoLocalSchema',
  id: -1710666494131765468,
  properties: {
    r'banderaLocalUrl': PropertySchema(
      id: 0,
      name: r'banderaLocalUrl',
      type: IsarType.string,
    ),
    r'banderaVisitanteUrl': PropertySchema(
      id: 1,
      name: r'banderaVisitanteUrl',
      type: IsarType.string,
    ),
    r'ciudad': PropertySchema(
      id: 2,
      name: r'ciudad',
      type: IsarType.string,
    ),
    r'equipoLocalEscudoUrl': PropertySchema(
      id: 3,
      name: r'equipoLocalEscudoUrl',
      type: IsarType.string,
    ),
    r'equipoLocalId': PropertySchema(
      id: 4,
      name: r'equipoLocalId',
      type: IsarType.long,
    ),
    r'equipoLocalNombre': PropertySchema(
      id: 5,
      name: r'equipoLocalNombre',
      type: IsarType.string,
    ),
    r'equipoVisitanteEscudoUrl': PropertySchema(
      id: 6,
      name: r'equipoVisitanteEscudoUrl',
      type: IsarType.string,
    ),
    r'equipoVisitanteId': PropertySchema(
      id: 7,
      name: r'equipoVisitanteId',
      type: IsarType.long,
    ),
    r'equipoVisitanteNombre': PropertySchema(
      id: 8,
      name: r'equipoVisitanteNombre',
      type: IsarType.string,
    ),
    r'esPartidoMundial': PropertySchema(
      id: 9,
      name: r'esPartidoMundial',
      type: IsarType.bool,
    ),
    r'estadio': PropertySchema(
      id: 10,
      name: r'estadio',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 11,
      name: r'estado',
      type: IsarType.byte,
      enumMap: _PartidoLocalSchemaestadoEnumValueMap,
    ),
    r'externalId': PropertySchema(
      id: 12,
      name: r'externalId',
      type: IsarType.long,
    ),
    r'fecha': PropertySchema(
      id: 13,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'golesLocal': PropertySchema(
      id: 14,
      name: r'golesLocal',
      type: IsarType.long,
    ),
    r'golesVisitante': PropertySchema(
      id: 15,
      name: r'golesVisitante',
      type: IsarType.long,
    ),
    r'grupo': PropertySchema(
      id: 16,
      name: r'grupo',
      type: IsarType.string,
    ),
    r'jornada': PropertySchema(
      id: 17,
      name: r'jornada',
      type: IsarType.long,
    ),
    r'ligaId': PropertySchema(
      id: 18,
      name: r'ligaId',
      type: IsarType.long,
    ),
    r'ronda': PropertySchema(
      id: 19,
      name: r'ronda',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 20,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _partidoLocalSchemaEstimateSize,
  serialize: _partidoLocalSchemaSerialize,
  deserialize: _partidoLocalSchemaDeserialize,
  deserializeProp: _partidoLocalSchemaDeserializeProp,
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
    r'fecha': IndexSchema(
      id: -5395179286312083551,
      name: r'fecha',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fecha',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'grupo': IndexSchema(
      id: -2515839146795051537,
      name: r'grupo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'grupo',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'ronda': IndexSchema(
      id: 8096491613971836666,
      name: r'ronda',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ronda',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'esPartidoMundial': IndexSchema(
      id: 3376307711814805264,
      name: r'esPartidoMundial',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'esPartidoMundial',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _partidoLocalSchemaGetId,
  getLinks: _partidoLocalSchemaGetLinks,
  attach: _partidoLocalSchemaAttach,
  version: '3.1.0+1',
);

int _partidoLocalSchemaEstimateSize(
  PartidoLocalSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.banderaLocalUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.banderaVisitanteUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ciudad;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.equipoLocalEscudoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.equipoLocalNombre.length * 3;
  {
    final value = object.equipoVisitanteEscudoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.equipoVisitanteNombre.length * 3;
  {
    final value = object.estadio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.grupo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ronda;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _partidoLocalSchemaSerialize(
  PartidoLocalSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.banderaLocalUrl);
  writer.writeString(offsets[1], object.banderaVisitanteUrl);
  writer.writeString(offsets[2], object.ciudad);
  writer.writeString(offsets[3], object.equipoLocalEscudoUrl);
  writer.writeLong(offsets[4], object.equipoLocalId);
  writer.writeString(offsets[5], object.equipoLocalNombre);
  writer.writeString(offsets[6], object.equipoVisitanteEscudoUrl);
  writer.writeLong(offsets[7], object.equipoVisitanteId);
  writer.writeString(offsets[8], object.equipoVisitanteNombre);
  writer.writeBool(offsets[9], object.esPartidoMundial);
  writer.writeString(offsets[10], object.estadio);
  writer.writeByte(offsets[11], object.estado.index);
  writer.writeLong(offsets[12], object.externalId);
  writer.writeDateTime(offsets[13], object.fecha);
  writer.writeLong(offsets[14], object.golesLocal);
  writer.writeLong(offsets[15], object.golesVisitante);
  writer.writeString(offsets[16], object.grupo);
  writer.writeLong(offsets[17], object.jornada);
  writer.writeLong(offsets[18], object.ligaId);
  writer.writeString(offsets[19], object.ronda);
  writer.writeDateTime(offsets[20], object.updatedAt);
}

PartidoLocalSchema _partidoLocalSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PartidoLocalSchema();
  object.banderaLocalUrl = reader.readStringOrNull(offsets[0]);
  object.banderaVisitanteUrl = reader.readStringOrNull(offsets[1]);
  object.ciudad = reader.readStringOrNull(offsets[2]);
  object.equipoLocalEscudoUrl = reader.readStringOrNull(offsets[3]);
  object.equipoLocalId = reader.readLong(offsets[4]);
  object.equipoLocalNombre = reader.readString(offsets[5]);
  object.equipoVisitanteEscudoUrl = reader.readStringOrNull(offsets[6]);
  object.equipoVisitanteId = reader.readLong(offsets[7]);
  object.equipoVisitanteNombre = reader.readString(offsets[8]);
  object.esPartidoMundial = reader.readBool(offsets[9]);
  object.estadio = reader.readStringOrNull(offsets[10]);
  object.estado = _PartidoLocalSchemaestadoValueEnumMap[
          reader.readByteOrNull(offsets[11])] ??
      EstadoPartido.programado;
  object.externalId = reader.readLong(offsets[12]);
  object.fecha = reader.readDateTime(offsets[13]);
  object.golesLocal = reader.readLongOrNull(offsets[14]);
  object.golesVisitante = reader.readLongOrNull(offsets[15]);
  object.grupo = reader.readStringOrNull(offsets[16]);
  object.isarId = id;
  object.jornada = reader.readLongOrNull(offsets[17]);
  object.ligaId = reader.readLong(offsets[18]);
  object.ronda = reader.readStringOrNull(offsets[19]);
  object.updatedAt = reader.readDateTime(offsets[20]);
  return object;
}

P _partidoLocalSchemaDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_PartidoLocalSchemaestadoValueEnumMap[
              reader.readByteOrNull(offset)] ??
          EstadoPartido.programado) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PartidoLocalSchemaestadoEnumValueMap = {
  'programado': 0,
  'enJuego': 1,
  'finalizado': 2,
  'pospuesto': 3,
  'cancelado': 4,
};
const _PartidoLocalSchemaestadoValueEnumMap = {
  0: EstadoPartido.programado,
  1: EstadoPartido.enJuego,
  2: EstadoPartido.finalizado,
  3: EstadoPartido.pospuesto,
  4: EstadoPartido.cancelado,
};

Id _partidoLocalSchemaGetId(PartidoLocalSchema object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _partidoLocalSchemaGetLinks(
    PartidoLocalSchema object) {
  return [];
}

void _partidoLocalSchemaAttach(
    IsarCollection<dynamic> col, Id id, PartidoLocalSchema object) {
  object.isarId = id;
}

extension PartidoLocalSchemaByIndex on IsarCollection<PartidoLocalSchema> {
  Future<PartidoLocalSchema?> getByExternalId(int externalId) {
    return getByIndex(r'externalId', [externalId]);
  }

  PartidoLocalSchema? getByExternalIdSync(int externalId) {
    return getByIndexSync(r'externalId', [externalId]);
  }

  Future<bool> deleteByExternalId(int externalId) {
    return deleteByIndex(r'externalId', [externalId]);
  }

  bool deleteByExternalIdSync(int externalId) {
    return deleteByIndexSync(r'externalId', [externalId]);
  }

  Future<List<PartidoLocalSchema?>> getAllByExternalId(
      List<int> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'externalId', values);
  }

  List<PartidoLocalSchema?> getAllByExternalIdSync(List<int> externalIdValues) {
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

  Future<Id> putByExternalId(PartidoLocalSchema object) {
    return putByIndex(r'externalId', object);
  }

  Id putByExternalIdSync(PartidoLocalSchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'externalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExternalId(List<PartidoLocalSchema> objects) {
    return putAllByIndex(r'externalId', objects);
  }

  List<Id> putAllByExternalIdSync(List<PartidoLocalSchema> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'externalId', objects, saveLinks: saveLinks);
  }
}

extension PartidoLocalSchemaQueryWhereSort
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QWhere> {
  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhere>
      anyExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'externalId'),
      );
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhere>
      anyLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ligaId'),
      );
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhere> anyFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fecha'),
      );
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhere>
      anyEsPartidoMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'esPartidoMundial'),
      );
    });
  }
}

extension PartidoLocalSchemaQueryWhere
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QWhereClause> {
  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      externalIdEqualTo(int externalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [externalId],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      ligaIdEqualTo(int ligaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ligaId',
        value: [ligaId],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      ligaIdNotEqualTo(int ligaId) {
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      ligaIdGreaterThan(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      ligaIdLessThan(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      ligaIdBetween(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      fechaEqualTo(DateTime fecha) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fecha',
        value: [fecha],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      fechaNotEqualTo(DateTime fecha) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fecha',
              lower: [],
              upper: [fecha],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fecha',
              lower: [fecha],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fecha',
              lower: [fecha],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fecha',
              lower: [],
              upper: [fecha],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      fechaGreaterThan(
    DateTime fecha, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fecha',
        lower: [fecha],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      fechaLessThan(
    DateTime fecha, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fecha',
        lower: [],
        upper: [fecha],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      fechaBetween(
    DateTime lowerFecha,
    DateTime upperFecha, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fecha',
        lower: [lowerFecha],
        includeLower: includeLower,
        upper: [upperFecha],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      grupoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'grupo',
        value: [null],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      grupoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'grupo',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      grupoEqualTo(String? grupo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'grupo',
        value: [grupo],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      grupoNotEqualTo(String? grupo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'grupo',
              lower: [],
              upper: [grupo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'grupo',
              lower: [grupo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'grupo',
              lower: [grupo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'grupo',
              lower: [],
              upper: [grupo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      rondaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ronda',
        value: [null],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      rondaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ronda',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      rondaEqualTo(String? ronda) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ronda',
        value: [ronda],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      rondaNotEqualTo(String? ronda) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ronda',
              lower: [],
              upper: [ronda],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ronda',
              lower: [ronda],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ronda',
              lower: [ronda],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ronda',
              lower: [],
              upper: [ronda],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      esPartidoMundialEqualTo(bool esPartidoMundial) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'esPartidoMundial',
        value: [esPartidoMundial],
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterWhereClause>
      esPartidoMundialNotEqualTo(bool esPartidoMundial) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esPartidoMundial',
              lower: [],
              upper: [esPartidoMundial],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esPartidoMundial',
              lower: [esPartidoMundial],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esPartidoMundial',
              lower: [esPartidoMundial],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'esPartidoMundial',
              lower: [],
              upper: [esPartidoMundial],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PartidoLocalSchemaQueryFilter
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QFilterCondition> {
  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banderaLocalUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banderaLocalUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banderaLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banderaLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banderaLocalUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banderaLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banderaLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banderaLocalUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banderaLocalUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaLocalUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaLocalUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banderaLocalUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banderaVisitanteUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banderaVisitanteUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banderaVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banderaVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banderaVisitanteUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banderaVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banderaVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banderaVisitanteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banderaVisitanteUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banderaVisitanteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      banderaVisitanteUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banderaVisitanteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ciudad',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ciudad',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ciudad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ciudad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciudad',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ciudadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ciudad',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equipoLocalEscudoUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equipoLocalEscudoUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoLocalEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoLocalEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoLocalEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoLocalEscudoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equipoLocalEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equipoLocalEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipoLocalEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipoLocalEscudoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoLocalEscudoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalEscudoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipoLocalEscudoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoLocalId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoLocalId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoLocalId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoLocalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreEqualTo(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreGreaterThan(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreLessThan(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreBetween(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreStartsWith(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreEndsWith(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipoLocalNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipoLocalNombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoLocalNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoLocalNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipoLocalNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equipoVisitanteEscudoUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equipoVisitanteEscudoUrl',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoVisitanteEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoVisitanteEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoVisitanteEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoVisitanteEscudoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equipoVisitanteEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equipoVisitanteEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipoVisitanteEscudoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipoVisitanteEscudoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoVisitanteEscudoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteEscudoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipoVisitanteEscudoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoVisitanteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipoVisitanteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipoVisitanteId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipoVisitanteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreEqualTo(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreGreaterThan(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreLessThan(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreBetween(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreStartsWith(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreEndsWith(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipoVisitanteNombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipoVisitanteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      equipoVisitanteNombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipoVisitanteNombre',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      esPartidoMundialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esPartidoMundial',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estadio',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estadio',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadio',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadio',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadoEqualTo(EstadoPartido value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadoGreaterThan(
    EstadoPartido value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadoLessThan(
    EstadoPartido value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      estadoBetween(
    EstadoPartido lower,
    EstadoPartido upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      externalIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      fechaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      fechaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      fechaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      fechaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fecha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'golesLocal',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'golesLocal',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesLocalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'golesLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesLocalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'golesLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesLocalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'golesLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesLocalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'golesLocal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesVisitanteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'golesVisitante',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesVisitanteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'golesVisitante',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesVisitanteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'golesVisitante',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesVisitanteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'golesVisitante',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesVisitanteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'golesVisitante',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      golesVisitanteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'golesVisitante',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grupo',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grupo',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      grupoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupo',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      jornadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jornada',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      jornadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jornada',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      jornadaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jornada',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      jornadaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jornada',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      jornadaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jornada',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      jornadaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jornada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ligaIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ligaId',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      ligaIdBetween(
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ronda',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ronda',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ronda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ronda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ronda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ronda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ronda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ronda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ronda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ronda',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ronda',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      rondaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ronda',
        value: '',
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterFilterCondition>
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

extension PartidoLocalSchemaQueryObject
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QFilterCondition> {}

extension PartidoLocalSchemaQueryLinks
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QFilterCondition> {}

extension PartidoLocalSchemaQuerySortBy
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QSortBy> {
  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByBanderaLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaLocalUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByBanderaLocalUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaLocalUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByBanderaVisitanteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaVisitanteUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByBanderaVisitanteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaVisitanteUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoLocalEscudoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalEscudoUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoLocalEscudoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalEscudoUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoLocalNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoLocalNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoVisitanteEscudoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteEscudoUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoVisitanteEscudoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteEscudoUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoVisitanteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoVisitanteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoVisitanteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEquipoVisitanteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEsPartidoMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPartidoMundial', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEsPartidoMundialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPartidoMundial', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEstadio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadio', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEstadioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadio', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByGolesLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesLocal', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByGolesLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesLocal', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByGolesVisitante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesVisitante', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByGolesVisitanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesVisitante', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByJornada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jornada', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByJornadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jornada', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByLigaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByRonda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ronda', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByRondaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ronda', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension PartidoLocalSchemaQuerySortThenBy
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QSortThenBy> {
  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByBanderaLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaLocalUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByBanderaLocalUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaLocalUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByBanderaVisitanteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaVisitanteUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByBanderaVisitanteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'banderaVisitanteUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoLocalEscudoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalEscudoUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoLocalEscudoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalEscudoUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoLocalNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoLocalNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoLocalNombre', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoVisitanteEscudoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteEscudoUrl', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoVisitanteEscudoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteEscudoUrl', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoVisitanteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoVisitanteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoVisitanteNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEquipoVisitanteNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipoVisitanteNombre', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEsPartidoMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPartidoMundial', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEsPartidoMundialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esPartidoMundial', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEstadio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadio', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEstadioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadio', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByGolesLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesLocal', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByGolesLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesLocal', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByGolesVisitante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesVisitante', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByGolesVisitanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'golesVisitante', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByGrupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByGrupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByJornada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jornada', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByJornadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jornada', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByLigaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ligaId', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByRonda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ronda', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByRondaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ronda', Sort.desc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension PartidoLocalSchemaQueryWhereDistinct
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct> {
  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByBanderaLocalUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banderaLocalUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByBanderaVisitanteUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'banderaVisitanteUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByCiudad({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ciudad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEquipoLocalEscudoUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoLocalEscudoUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEquipoLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoLocalId');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEquipoLocalNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoLocalNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEquipoVisitanteEscudoUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoVisitanteEscudoUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEquipoVisitanteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoVisitanteId');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEquipoVisitanteNombre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipoVisitanteNombre',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEsPartidoMundial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esPartidoMundial');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEstadio({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByGolesLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'golesLocal');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByGolesVisitante() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'golesVisitante');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByGrupo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByJornada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jornada');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByLigaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ligaId');
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByRonda({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ronda', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension PartidoLocalSchemaQueryProperty
    on QueryBuilder<PartidoLocalSchema, PartidoLocalSchema, QQueryProperty> {
  QueryBuilder<PartidoLocalSchema, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations>
      banderaLocalUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banderaLocalUrl');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations>
      banderaVisitanteUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'banderaVisitanteUrl');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations> ciudadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ciudad');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations>
      equipoLocalEscudoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoLocalEscudoUrl');
    });
  }

  QueryBuilder<PartidoLocalSchema, int, QQueryOperations>
      equipoLocalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoLocalId');
    });
  }

  QueryBuilder<PartidoLocalSchema, String, QQueryOperations>
      equipoLocalNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoLocalNombre');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations>
      equipoVisitanteEscudoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoVisitanteEscudoUrl');
    });
  }

  QueryBuilder<PartidoLocalSchema, int, QQueryOperations>
      equipoVisitanteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoVisitanteId');
    });
  }

  QueryBuilder<PartidoLocalSchema, String, QQueryOperations>
      equipoVisitanteNombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipoVisitanteNombre');
    });
  }

  QueryBuilder<PartidoLocalSchema, bool, QQueryOperations>
      esPartidoMundialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esPartidoMundial');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations>
      estadioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadio');
    });
  }

  QueryBuilder<PartidoLocalSchema, EstadoPartido, QQueryOperations>
      estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<PartidoLocalSchema, int, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<PartidoLocalSchema, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<PartidoLocalSchema, int?, QQueryOperations>
      golesLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'golesLocal');
    });
  }

  QueryBuilder<PartidoLocalSchema, int?, QQueryOperations>
      golesVisitanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'golesVisitante');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations> grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupo');
    });
  }

  QueryBuilder<PartidoLocalSchema, int?, QQueryOperations> jornadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jornada');
    });
  }

  QueryBuilder<PartidoLocalSchema, int, QQueryOperations> ligaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ligaId');
    });
  }

  QueryBuilder<PartidoLocalSchema, String?, QQueryOperations> rondaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ronda');
    });
  }

  QueryBuilder<PartidoLocalSchema, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
