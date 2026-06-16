// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamModel {

 int get id; String get name; String? get code; String? get country; String? get logo;@JsonKey(name: 'national') bool? get isNational;
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamModelCopyWith<TeamModel> get copyWith => _$TeamModelCopyWithImpl<TeamModel>(this as TeamModel, _$identity);

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.country, country) || other.country == country)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.isNational, isNational) || other.isNational == isNational));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,country,logo,isNational);

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, code: $code, country: $country, logo: $logo, isNational: $isNational)';
}


}

/// @nodoc
abstract mixin class $TeamModelCopyWith<$Res>  {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) _then) = _$TeamModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? code, String? country, String? logo,@JsonKey(name: 'national') bool? isNational
});




}
/// @nodoc
class _$TeamModelCopyWithImpl<$Res>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._self, this._then);

  final TeamModel _self;
  final $Res Function(TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? country = freezed,Object? logo = freezed,Object? isNational = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,isNational: freezed == isNational ? _self.isNational : isNational // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamModel].
extension TeamModelPatterns on TeamModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? code,  String? country,  String? logo, @JsonKey(name: 'national')  bool? isNational)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.country,_that.logo,_that.isNational);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? code,  String? country,  String? logo, @JsonKey(name: 'national')  bool? isNational)  $default,) {final _that = this;
switch (_that) {
case _TeamModel():
return $default(_that.id,_that.name,_that.code,_that.country,_that.logo,_that.isNational);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? code,  String? country,  String? logo, @JsonKey(name: 'national')  bool? isNational)?  $default,) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.country,_that.logo,_that.isNational);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamModel implements TeamModel {
  const _TeamModel({required this.id, required this.name, this.code, this.country, this.logo, @JsonKey(name: 'national') this.isNational});
  factory _TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? code;
@override final  String? country;
@override final  String? logo;
@override@JsonKey(name: 'national') final  bool? isNational;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamModelCopyWith<_TeamModel> get copyWith => __$TeamModelCopyWithImpl<_TeamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.country, country) || other.country == country)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.isNational, isNational) || other.isNational == isNational));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,country,logo,isNational);

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, code: $code, country: $country, logo: $logo, isNational: $isNational)';
}


}

/// @nodoc
abstract mixin class _$TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(_TeamModel value, $Res Function(_TeamModel) _then) = __$TeamModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? code, String? country, String? logo,@JsonKey(name: 'national') bool? isNational
});




}
/// @nodoc
class __$TeamModelCopyWithImpl<$Res>
    implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(this._self, this._then);

  final _TeamModel _self;
  final $Res Function(_TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? country = freezed,Object? logo = freezed,Object? isNational = freezed,}) {
  return _then(_TeamModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,isNational: freezed == isNational ? _self.isNational : isNational // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$TeamResponse {

 TeamModel get team;
/// Create a copy of TeamResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamResponseCopyWith<TeamResponse> get copyWith => _$TeamResponseCopyWithImpl<TeamResponse>(this as TeamResponse, _$identity);

  /// Serializes this TeamResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamResponse&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,team);

@override
String toString() {
  return 'TeamResponse(team: $team)';
}


}

/// @nodoc
abstract mixin class $TeamResponseCopyWith<$Res>  {
  factory $TeamResponseCopyWith(TeamResponse value, $Res Function(TeamResponse) _then) = _$TeamResponseCopyWithImpl;
@useResult
$Res call({
 TeamModel team
});


$TeamModelCopyWith<$Res> get team;

}
/// @nodoc
class _$TeamResponseCopyWithImpl<$Res>
    implements $TeamResponseCopyWith<$Res> {
  _$TeamResponseCopyWithImpl(this._self, this._then);

  final TeamResponse _self;
  final $Res Function(TeamResponse) _then;

/// Create a copy of TeamResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? team = null,}) {
  return _then(_self.copyWith(
team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as TeamModel,
  ));
}
/// Create a copy of TeamResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get team {
  
  return $TeamModelCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamResponse].
extension TeamResponsePatterns on TeamResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamResponse value)  $default,){
final _that = this;
switch (_that) {
case _TeamResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TeamResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TeamModel team)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamResponse() when $default != null:
return $default(_that.team);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TeamModel team)  $default,) {final _that = this;
switch (_that) {
case _TeamResponse():
return $default(_that.team);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TeamModel team)?  $default,) {final _that = this;
switch (_that) {
case _TeamResponse() when $default != null:
return $default(_that.team);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamResponse implements TeamResponse {
  const _TeamResponse({required this.team});
  factory _TeamResponse.fromJson(Map<String, dynamic> json) => _$TeamResponseFromJson(json);

@override final  TeamModel team;

/// Create a copy of TeamResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamResponseCopyWith<_TeamResponse> get copyWith => __$TeamResponseCopyWithImpl<_TeamResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamResponse&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,team);

@override
String toString() {
  return 'TeamResponse(team: $team)';
}


}

/// @nodoc
abstract mixin class _$TeamResponseCopyWith<$Res> implements $TeamResponseCopyWith<$Res> {
  factory _$TeamResponseCopyWith(_TeamResponse value, $Res Function(_TeamResponse) _then) = __$TeamResponseCopyWithImpl;
@override @useResult
$Res call({
 TeamModel team
});


@override $TeamModelCopyWith<$Res> get team;

}
/// @nodoc
class __$TeamResponseCopyWithImpl<$Res>
    implements _$TeamResponseCopyWith<$Res> {
  __$TeamResponseCopyWithImpl(this._self, this._then);

  final _TeamResponse _self;
  final $Res Function(_TeamResponse) _then;

/// Create a copy of TeamResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? team = null,}) {
  return _then(_TeamResponse(
team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as TeamModel,
  ));
}

/// Create a copy of TeamResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get team {
  
  return $TeamModelCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}

// dart format on
