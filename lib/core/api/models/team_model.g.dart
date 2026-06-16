// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => _TeamModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  code: json['code'] as String?,
  country: json['country'] as String?,
  logo: json['logo'] as String?,
  isNational: json['national'] as bool?,
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'country': instance.country,
      'logo': instance.logo,
      'national': instance.isNational,
    };

_TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) =>
    _TeamResponse(
      team: TeamModel.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamResponseToJson(_TeamResponse instance) =>
    <String, dynamic>{'team': instance.team};
