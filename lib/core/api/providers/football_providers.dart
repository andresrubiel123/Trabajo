import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/football_service.dart';
import '../models/team_model.dart';
import '../models/fixture_model.dart';

// Parameter class for the fixtures provider family
class FixtureParams {
  final int leagueId;
  final int season;
  final String? round;

  const FixtureParams({
    required this.leagueId,
    required this.season,
    this.round,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FixtureParams &&
          runtimeType == other.runtimeType &&
          leagueId == other.leagueId &&
          season == other.season &&
          round == other.round;

  @override
  int get hashCode => leagueId.hashCode ^ season.hashCode ^ round.hashCode;
}

// Parameter class for teams/rounds family
class LeagueParams {
  final int leagueId;
  final int season;

  const LeagueParams({
    required this.leagueId,
    required this.season,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeagueParams &&
          runtimeType == other.runtimeType &&
          leagueId == other.leagueId &&
          season == other.season;

  @override
  int get hashCode => leagueId.hashCode ^ season.hashCode;
}

// FutureProvider for Teams
final teamsProvider = FutureProvider.family<List<TeamModel>, LeagueParams>((ref, params) async {
  final service = ref.watch(footballServiceProvider);
  return await service.getTeams(leagueId: params.leagueId, season: params.season);
});

// FutureProvider for League Rounds/Dates
final roundsProvider = FutureProvider.family<List<String>, LeagueParams>((ref, params) async {
  final service = ref.watch(footballServiceProvider);
  return await service.getRounds(leagueId: params.leagueId, season: params.season);
});

// FutureProvider for Fixtures/Matches (and their results)
final fixturesProvider = FutureProvider.family<List<FixtureModel>, FixtureParams>((ref, params) async {
  final service = ref.watch(footballServiceProvider);
  return await service.getFixtures(
    leagueId: params.leagueId,
    season: params.season,
    round: params.round,
  );
});

// FutureProvider for Competitions
final competitionsProvider = FutureProvider<List<CompetitionModel>>((ref) async {
  final service = ref.watch(footballServiceProvider);
  return await service.getCompetitions();
});
