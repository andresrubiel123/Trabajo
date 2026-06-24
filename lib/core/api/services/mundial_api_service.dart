/// Servicio para consumir las APIs externas Football-Data.org y TheSportsDB.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-24
///
/// Prioridad de datos:
/// - Partidos y equipos: Football-Data.org (más fiable para Copa del Mundo)
/// - Escudos y banderas: TheSportsDB (mejor calidad visual)
/// - Fallback de banderas: flagcdn.com (siempre disponible, gratuito)
library;

import 'package:dio/dio.dart';

/// Modelo de datos para un partido obtenido de APIs externas.
class PartidoApiModel {
  const PartidoApiModel({
    required this.externalId,
    required this.equipoLocalId,
    required this.equipoLocalNombre,
    this.equipoLocalEscudoUrl,
    this.banderaLocalUrl,
    required this.equipoVisitanteId,
    required this.equipoVisitanteNombre,
    this.equipoVisitanteEscudoUrl,
    this.banderaVisitanteUrl,
    required this.fecha,
    required this.estado,
    this.golesLocal,
    this.golesVisitante,
    this.grupo,
    this.ronda,
    this.jornada,
    this.estadio,
    this.ciudad,
  });

  final int externalId;
  final int equipoLocalId;
  final String equipoLocalNombre;
  final String? equipoLocalEscudoUrl;
  final String? banderaLocalUrl;
  final int equipoVisitanteId;
  final String equipoVisitanteNombre;
  final String? equipoVisitanteEscudoUrl;
  final String? banderaVisitanteUrl;
  final DateTime fecha;
  final String estado;
  final int? golesLocal;
  final int? golesVisitante;
  final String? grupo;
  final String? ronda;
  final int? jornada;
  final String? estadio;
  final String? ciudad;
}

/// Modelo de datos para un equipo/selección obtenido de APIs externas.
class EquipoApiModel {
  const EquipoApiModel({
    required this.externalId,
    required this.nombre,
    required this.pais,
    this.escudoUrl,
    this.banderaUrl,
    this.codigoPais,
    this.grupo,
  });

  final int externalId;
  final String nombre;
  final String pais;
  final String? escudoUrl;
  final String? banderaUrl;
  final String? codigoPais;
  final String? grupo;
}

/// Servicio que consulta Football-Data.org y TheSportsDB para la Copa del Mundo.
///
/// Uso sin backend propio: los datos se obtienen directamente de las APIs externas
/// y se persisten en la base local Isar para funcionamiento offline.
class MundialApiService {
  MundialApiService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  // ── Constantes de Football-Data.org ──────────────────────────────────────

  static const String _footballDataBaseUrl = 'https://api.football-data.org/v4';

  /// API Key de Football-Data.org (Free tier: 10 req/min, acceso a WC 2026).
  /// Reemplazar con la clave real del proyecto.
  static const String _footballDataApiKey = 'a974d8bd310c43cc8d2b20095b1eacaf';

  // ── Constantes de TheSportsDB ─────────────────────────────────────────────

  static const String _sportsDbBaseUrl = 'https://www.thesportsdb.com/api/v1/json/3';

  /// ID de FIFA World Cup en TheSportsDB (reservado para futuras consultas por liga).
  // ignore: unused_field
  static const String _sportsDbLeagueId = '4480';

  // ── Métodos Públicos ──────────────────────────────────────────────────────

  /// Obtiene todos los partidos de la Copa del Mundo 2026 desde Football-Data.org.
  ///
  /// Retorna lista vacía si hay error de red o si la API key no es válida.
  Future<List<PartidoApiModel>> fetchPartidosMundial() async {
    try {
      final response = await _dio.get(
        '$_footballDataBaseUrl/competitions/WC/matches',
        queryParameters: {'season': '2026'},
        options: Options(
          headers: {'X-Auth-Token': _footballDataApiKey},
          sendTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );

      final data = response.data as Map<String, dynamic>?;
      if (data == null || data['matches'] == null) return [];

      final matchesJson = data['matches'] as List<dynamic>;
      return matchesJson
          .map((m) => _parsePartidoFootballData(m as Map<String, dynamic>))
          .whereType<PartidoApiModel>()
          .toList();
    } on DioException catch (e) {
      // Error de red o API key inválida — no es crítico, se usan datos del seed
      // ignore: avoid_print
      print('[MundialApiService] fetchPartidosMundial error: ${e.message}');
      return [];
    }
  }

  /// Obtiene los 32 equipos de la Copa del Mundo 2026 desde Football-Data.org.
  ///
  /// Retorna lista vacía si hay error de red.
  Future<List<EquipoApiModel>> fetchEquiposMundial() async {
    try {
      final response = await _dio.get(
        '$_footballDataBaseUrl/competitions/WC/teams',
        queryParameters: {'season': '2026'},
        options: Options(
          headers: {'X-Auth-Token': _footballDataApiKey},
          sendTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );

      final data = response.data as Map<String, dynamic>?;
      if (data == null || data['teams'] == null) return [];

      final teamsJson = data['teams'] as List<dynamic>;
      return teamsJson
          .map((t) => _parseEquipoFootballData(t as Map<String, dynamic>))
          .whereType<EquipoApiModel>()
          .toList();
    } on DioException catch (e) {
      // ignore: avoid_print
      print('[MundialApiService] fetchEquiposMundial error: ${e.message}');
      return [];
    }
  }

  /// Enriquece un equipo con el escudo oficial de TheSportsDB.
  ///
  /// Parámetros:
  /// - [nombreEquipo]: nombre del equipo a buscar.
  /// Retorna la URL del escudo o null si no se encontró.
  Future<String?> fetchEscudoTheSportsDb(String nombreEquipo) async {
    try {
      final response = await _dio.get(
        '$_sportsDbBaseUrl/searchteams.php',
        queryParameters: {'t': nombreEquipo},
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      final data = response.data as Map<String, dynamic>?;
      final teams = data?['teams'] as List<dynamic>?;
      if (teams == null || teams.isEmpty) return null;
      return teams.first['strTeamBadge'] as String?;
    } on DioException {
      return null;
    }
  }

  // ── Parsers privados ──────────────────────────────────────────────────────

  /// Parsea un partido desde la respuesta de Football-Data.org.
  PartidoApiModel? _parsePartidoFootballData(Map<String, dynamic> m) {
    try {
      final homeTeam = m['homeTeam'] as Map<String, dynamic>? ?? {};
      final awayTeam = m['awayTeam'] as Map<String, dynamic>? ?? {};
      final score = m['score'] as Map<String, dynamic>? ?? {};
      final fullTime = score['fullTime'] as Map<String, dynamic>? ?? {};
      final rawStatus = m['status'] as String? ?? 'SCHEDULED';

      // Extraer grupo y ronda
      final stage = m['stage'] as String? ?? '';
      final group = m['group'] as String?;
      final matchday = m['matchday'] as int?;

      final String? grupoLetra = group?.replaceAll('GROUP_', '');
      final String ronda = _stageToRonda(stage);

      // Construir URL de bandera desde flagcdn con el código ISO
      final homeCrest = homeTeam['crest'] as String?;
      final awayCrest = awayTeam['crest'] as String?;

      return PartidoApiModel(
        externalId: m['id'] as int? ?? 0,
        equipoLocalId: homeTeam['id'] as int? ?? 0,
        equipoLocalNombre: homeTeam['name'] as String? ?? 'Local',
        equipoLocalEscudoUrl: homeCrest,
        banderaLocalUrl: _buildFlagUrl(homeTeam['tla'] as String?),
        equipoVisitanteId: awayTeam['id'] as int? ?? 0,
        equipoVisitanteNombre: awayTeam['name'] as String? ?? 'Visitante',
        equipoVisitanteEscudoUrl: awayCrest,
        banderaVisitanteUrl: _buildFlagUrl(awayTeam['tla'] as String?),
        fecha: DateTime.tryParse(m['utcDate'] as String? ?? '') ?? DateTime.now(),
        estado: rawStatus,
        golesLocal: fullTime['home'] as int?,
        golesVisitante: fullTime['away'] as int?,
        grupo: grupoLetra,
        ronda: ronda,
        jornada: matchday,
        estadio: (m['venue'] as String?),
        ciudad: null,
      );
    } catch (_) {
      return null;
    }
  }

  /// Parsea un equipo desde la respuesta de Football-Data.org.
  EquipoApiModel? _parseEquipoFootballData(Map<String, dynamic> t) {
    try {
      final tla = t['tla'] as String?;
      return EquipoApiModel(
        externalId: t['id'] as int? ?? 0,
        nombre: t['name'] as String? ?? '',
        pais: t['area']?['name'] as String? ?? '',
        escudoUrl: t['crest'] as String?,
        banderaUrl: _buildFlagUrl(tla),
        codigoPais: tla,
      );
    } catch (_) {
      return null;
    }
  }

  /// Construye URL de bandera usando flagcdn.com a partir del código TLA.
  ///
  /// flagcdn.com acepta códigos ISO-2 en minúsculas (ej: "ar", "br").
  /// Football-Data usa TLA de 3 letras, por lo que hacemos un mapeo básico.
  String? _buildFlagUrl(String? tla) {
    if (tla == null) return null;
    final iso2 = _tlaToIso2[tla.toUpperCase()];
    if (iso2 == null) return null;
    return 'https://flagcdn.com/w80/${iso2.toLowerCase()}.png';
  }

  /// Convierte el stage de Football-Data.org a nombre en español.
  String _stageToRonda(String stage) {
    switch (stage.toUpperCase()) {
      case 'GROUP_STAGE':
        return 'Fase de Grupos';
      case 'LAST_16':
      case 'ROUND_OF_16':
        return 'Octavos de Final';
      case 'QUARTER_FINALS':
        return 'Cuartos de Final';
      case 'SEMI_FINALS':
        return 'Semifinal';
      case 'THIRD_PLACE':
        return 'Tercer Lugar';
      case 'FINAL':
        return 'Final';
      default:
        return stage;
    }
  }

  /// Mapeo de códigos TLA de Football-Data.org → ISO-2 para flagcdn.com.
  static const Map<String, String> _tlaToIso2 = {
    'ARG': 'ar', 'MAR': 'ma', 'POR': 'pt', 'ANG': 'ao', 'TUN': 'tn',
    'ESP': 'es', 'MEX': 'mx', 'NED': 'nl', 'CAN': 'ca', 'CRC': 'cr',
    'BRA': 'br', 'SRB': 'rs', 'SUI': 'ch', 'SEN': 'sn', 'CHN': 'cn',
    'FRA': 'fr', 'JPN': 'jp', 'USA': 'us', 'DEN': 'dk', 'GER': 'de',
    'URU': 'uy', 'ENG': 'gb-eng', 'POL': 'pl', 'COL': 'co', 'CRO': 'hr',
    'CMR': 'cm', 'ECU': 'ec', 'BEL': 'be', 'SAU': 'sa', 'IRN': 'ir',
    'AUS': 'au', 'KOR': 'kr',
  };
}
