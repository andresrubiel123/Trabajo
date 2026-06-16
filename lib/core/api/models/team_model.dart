import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

// ignore_for_file: invalid_annotation_target

@freezed
abstract class TeamModel with _$TeamModel {
  const factory TeamModel({
    required int id,
    required String name,
    String? code,
    String? country,
    String? logo,
    @JsonKey(name: 'national') bool? isNational,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);
}

// Wrapper for the API-Football team response which contains "team" and "venue"
@freezed
abstract class TeamResponse with _$TeamResponse {
  const factory TeamResponse({
    required TeamModel team,
  }) = _TeamResponse;

  factory TeamResponse.fromJson(Map<String, dynamic> json) => _$TeamResponseFromJson(json);
}
