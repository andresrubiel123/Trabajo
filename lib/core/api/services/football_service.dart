import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_client.dart';
import '../models/team_model.dart';
import '../models/fixture_model.dart';

class CompetitionModel {
  final int id;
  final String name;
  final String? logo;
  final String? type;

  CompetitionModel({required this.id, required this.name, this.logo, this.type});
}

class FootballService {
  final ApiClient _apiClient;

  FootballService(this._apiClient);

  // Fetch competitions from the local backend
  Future<List<CompetitionModel>> getCompetitions() async {
    final response = await _apiClient.get('/competiciones', queryParameters: {
      'size': 100,
    });

    if (response.data != null && response.data['data'] != null && response.data['data']['content'] != null) {
      final List<dynamic> list = response.data['data']['content'];
      return list.map((item) => CompetitionModel(
        id: item['id'] ?? 0,
        name: item['nombre'] ?? '',
        logo: item['logoUrl'],
        type: item['tipo'],
      )).toList();
    }
    return [];
  }

  // Fetch teams from the local backend
  Future<List<TeamModel>> getTeams({required int leagueId, required int season}) async {
    final response = await _apiClient.get('/equipos', queryParameters: {
      'size': 1000,
    });

    if (response.data != null && response.data['data'] != null && response.data['data']['content'] != null) {
      final List<dynamic> list = response.data['data']['content'];
      return list.map((item) => TeamModel(
        id: item['id'] ?? 0,
        name: item['nombre'] ?? '',
        logo: item['escudoUrl'],
      )).toList();
    }
    return [];
  }

  // Generate round names for the UI
  Future<List<String>> getRounds({required int leagueId, required int season}) async {
    return List.generate(38, (index) => 'Matchday ${index + 1}');
  }

  // Fetch matches/fixtures from the local backend and map to FixtureModel
  Future<List<FixtureModel>> getFixtures({
    required int leagueId,
    required int season,
    String? round,
  }) async {
    final response = await _apiClient.get('/partidos/competicion/$leagueId', queryParameters: {
      'size': 1000,
    });

    if (response.data != null && response.data['data'] != null && response.data['data']['content'] != null) {
      final List<dynamic> list = response.data['data']['content'];
      
      return list.map((item) {
        final local = item['equipoLocal'] ?? {};
        final visitante = item['equipoVisitante'] ?? {};
        final comp = item['competicion'] ?? {};
        
        final String fechaStr = item['fecha'] ?? '';
        final DateTime parsedDate = DateTime.tryParse(fechaStr) ?? DateTime.now();
        final int timestamp = parsedDate.millisecondsSinceEpoch ~/ 1000;
        
        final statusShort = item['estado'] == 'FINISHED' ? 'FT' : (item['estado'] == 'IN_PLAY' ? 'LIVE' : 'NS');
        final statusLong = item['estado'] ?? 'Scheduled';

        return FixtureModel(
          fixture: FixtureInfo(
            id: item['id'] ?? 0,
            date: fechaStr,
            timezone: 'UTC',
            timestamp: timestamp,
            status: FixtureStatus(
              long: statusLong,
              short: statusShort,
            ),
          ),
          league: LeagueInfo(
            id: comp['id'] ?? 0,
            name: comp['nombre'] ?? '',
            country: 'Mundial',
          ),
          teams: MatchTeams(
            home: TeamModel(
              id: local['id'] ?? 0,
              name: local['nombre'] ?? 'Local',
              logo: local['escudoUrl'],
            ),
            away: TeamModel(
              id: visitante['id'] ?? 0,
              name: visitante['nombre'] ?? 'Visitante',
              logo: visitante['escudoUrl'],
            ),
          ),
          goals: MatchGoals(
            home: item['golesLocal'],
            away: item['golesVisitante'],
          ),
          score: MatchScore(
            fulltime: MatchGoals(
              home: item['golesLocal'],
              away: item['golesVisitante'],
            ),
          ),
        );
      }).toList();
    }
    return [];
  }
}

final footballServiceProvider = Provider<FootballService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return FootballService(apiClient);
});
