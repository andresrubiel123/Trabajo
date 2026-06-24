/// Repositorio local para favoritos del usuario almacenados en Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import '../schemas/favorito_schema.dart';

/// Proporciona operaciones CRUD sobre la colección [FavoritoSchema] en Isar.
///
/// Esta colección es exclusivamente local — nunca se sincroniza con el servidor.
class FavoritoLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const FavoritoLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna todos los favoritos del usuario ordenados por fecha de creación descendente.
  Future<List<FavoritoSchema>> findAll() {
    return _isar.favoritoSchemas
        .where()
        .sortByCreadoEnDesc()
        .findAll();
  }

  /// Retorna los favoritos de un tipo específico.
  ///
  /// Parámetros:
  /// - [tipo]: tipo de entidad favorita (liga, equipo o partido).
  Future<List<FavoritoSchema>> findByTipo(TipoFavorito tipo) {
    return _isar.favoritoSchemas
        .filter()
        .tipoEqualTo(tipo)
        .sortByCreadoEnDesc()
        .findAll();
  }

  /// Verifica si una entidad está marcada como favorita.
  ///
  /// Parámetros:
  /// - [referenciaId]: ID externo de la entidad.
  Future<bool> esFavorito(String referenciaId) async {
    final count = await _isar.favoritoSchemas
        .filter()
        .referenciaIdEqualTo(referenciaId)
        .count();
    return count > 0;
  }

  /// Agrega una entidad a favoritos.
  ///
  /// Parámetros:
  /// - [favorito]: objeto [FavoritoSchema] listo para persistir.
  Future<void> agregar(FavoritoSchema favorito) async {
    await _isar.writeTxn(() async {
      await _isar.favoritoSchemas.put(favorito);
    });
  }

  /// Elimina un favorito por su [isarId].
  ///
  /// Parámetros:
  /// - [isarId]: ID interno de Isar del favorito a eliminar.
  Future<void> eliminar(int isarId) async {
    await _isar.writeTxn(() async {
      await _isar.favoritoSchemas.delete(isarId);
    });
  }

  /// Elimina un favorito por su [referenciaId] externo.
  ///
  /// Parámetros:
  /// - [referenciaId]: ID externo de la entidad favorita.
  Future<void> eliminarPorReferencia(String referenciaId) async {
    final favorito = await _isar.favoritoSchemas
        .filter()
        .referenciaIdEqualTo(referenciaId)
        .findFirst();
    if (favorito == null) return;
    await _isar.writeTxn(() async {
      await _isar.favoritoSchemas.delete(favorito.isarId);
    });
  }
}
