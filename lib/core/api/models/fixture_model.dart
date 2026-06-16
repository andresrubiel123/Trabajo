import 'package:freezed_annotation/freezed_annotation.dart';
import 'team_model.dart';

part 'fixture_model.freezed.dart';
part 'fixture_model.g.dart';

@freezed
abstract class FixtureInfo with _$FixtureInfo {
  const factory FixtureInfo({
    required int id,
    required String date,
    required String timezone,
    required int timestamp,
    required FixtureStatus status,
  }) = _FixtureInfo;

  factory FixtureInfo.fromJson(Map<String, dynamic> json) => _$FixtureInfoFromJson(json);
}

@freezed
abstract class FixtureStatus with _$FixtureStatus {
  const factory FixtureStatus({
    required String long,
    required String short,
    int? elapsed,
  }) = _FixtureStatus;

  factory FixtureStatus.fromJson(Map<String, dynamic> json) => _$FixtureStatusFromJson(json);
}

@freezed
abstract class LeagueInfo with _$LeagueInfo {
  const factory LeagueInfo({
    required int id,
    required String name,
    required String country,
    String? logo,
    int? season,
    String? round,
  }) = _LeagueInfo;

  factory LeagueInfo.fromJson(Map<String, dynamic> json) => _$LeagueInfoFromJson(json);
}

@freezed
abstract class MatchTeams with _$MatchTeams {
  const factory MatchTeams({
    required TeamModel home,
    required TeamModel away,
  }) = _MatchTeams;

  factory MatchTeams.fromJson(Map<String, dynamic> json) => _$MatchTeamsFromJson(json);
}

@freezed
abstract class MatchGoals with _$MatchGoals {
  const factory MatchGoals({
    int? home,
    int? away,
  }) = _MatchGoals;

  factory MatchGoals.fromJson(Map<String, dynamic> json) => _$MatchGoalsFromJson(json);
}

@freezed
abstract class MatchScore with _$MatchScore {
  const factory MatchScore({
    MatchGoals? halftime,
    MatchGoals? fulltime,
    MatchGoals? extratime,
    MatchGoals? penalty,
  }) = _MatchScore;

  factory MatchScore.fromJson(Map<String, dynamic> json) => _$MatchScoreFromJson(json);
}

@freezed
abstract class FixtureModel with _$FixtureModel {
  const factory FixtureModel({
    required FixtureInfo fixture,
    required LeagueInfo league,
    required MatchTeams teams,
    required MatchGoals goals,
    required MatchScore score,
  }) = _FixtureModel;

  factory FixtureModel.fromJson(Map<String, dynamic> json) => _$FixtureModelFromJson(json);
}
