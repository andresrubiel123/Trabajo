// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FixtureInfo _$FixtureInfoFromJson(Map<String, dynamic> json) => _FixtureInfo(
  id: (json['id'] as num).toInt(),
  date: json['date'] as String,
  timezone: json['timezone'] as String,
  timestamp: (json['timestamp'] as num).toInt(),
  status: FixtureStatus.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FixtureInfoToJson(_FixtureInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'timezone': instance.timezone,
      'timestamp': instance.timestamp,
      'status': instance.status,
    };

_FixtureStatus _$FixtureStatusFromJson(Map<String, dynamic> json) =>
    _FixtureStatus(
      long: json['long'] as String,
      short: json['short'] as String,
      elapsed: (json['elapsed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FixtureStatusToJson(_FixtureStatus instance) =>
    <String, dynamic>{
      'long': instance.long,
      'short': instance.short,
      'elapsed': instance.elapsed,
    };

_LeagueInfo _$LeagueInfoFromJson(Map<String, dynamic> json) => _LeagueInfo(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  country: json['country'] as String,
  logo: json['logo'] as String?,
  season: (json['season'] as num?)?.toInt(),
  round: json['round'] as String?,
);

Map<String, dynamic> _$LeagueInfoToJson(_LeagueInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'season': instance.season,
      'round': instance.round,
    };

_MatchTeams _$MatchTeamsFromJson(Map<String, dynamic> json) => _MatchTeams(
  home: TeamModel.fromJson(json['home'] as Map<String, dynamic>),
  away: TeamModel.fromJson(json['away'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchTeamsToJson(_MatchTeams instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

_MatchGoals _$MatchGoalsFromJson(Map<String, dynamic> json) => _MatchGoals(
  home: (json['home'] as num?)?.toInt(),
  away: (json['away'] as num?)?.toInt(),
);

Map<String, dynamic> _$MatchGoalsToJson(_MatchGoals instance) =>
    <String, dynamic>{'home': instance.home, 'away': instance.away};

_MatchScore _$MatchScoreFromJson(Map<String, dynamic> json) => _MatchScore(
  halftime: json['halftime'] == null
      ? null
      : MatchGoals.fromJson(json['halftime'] as Map<String, dynamic>),
  fulltime: json['fulltime'] == null
      ? null
      : MatchGoals.fromJson(json['fulltime'] as Map<String, dynamic>),
  extratime: json['extratime'] == null
      ? null
      : MatchGoals.fromJson(json['extratime'] as Map<String, dynamic>),
  penalty: json['penalty'] == null
      ? null
      : MatchGoals.fromJson(json['penalty'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchScoreToJson(_MatchScore instance) =>
    <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };

_FixtureModel _$FixtureModelFromJson(Map<String, dynamic> json) =>
    _FixtureModel(
      fixture: FixtureInfo.fromJson(json['fixture'] as Map<String, dynamic>),
      league: LeagueInfo.fromJson(json['league'] as Map<String, dynamic>),
      teams: MatchTeams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: MatchGoals.fromJson(json['goals'] as Map<String, dynamic>),
      score: MatchScore.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureModelToJson(_FixtureModel instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'score': instance.score,
    };
