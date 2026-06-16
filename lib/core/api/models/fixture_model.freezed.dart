// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FixtureInfo {

 int get id; String get date; String get timezone; int get timestamp; FixtureStatus get status;
/// Create a copy of FixtureInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixtureInfoCopyWith<FixtureInfo> get copyWith => _$FixtureInfoCopyWithImpl<FixtureInfo>(this as FixtureInfo, _$identity);

  /// Serializes this FixtureInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixtureInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,timezone,timestamp,status);

@override
String toString() {
  return 'FixtureInfo(id: $id, date: $date, timezone: $timezone, timestamp: $timestamp, status: $status)';
}


}

/// @nodoc
abstract mixin class $FixtureInfoCopyWith<$Res>  {
  factory $FixtureInfoCopyWith(FixtureInfo value, $Res Function(FixtureInfo) _then) = _$FixtureInfoCopyWithImpl;
@useResult
$Res call({
 int id, String date, String timezone, int timestamp, FixtureStatus status
});


$FixtureStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$FixtureInfoCopyWithImpl<$Res>
    implements $FixtureInfoCopyWith<$Res> {
  _$FixtureInfoCopyWithImpl(this._self, this._then);

  final FixtureInfo _self;
  final $Res Function(FixtureInfo) _then;

/// Create a copy of FixtureInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? timezone = null,Object? timestamp = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FixtureStatus,
  ));
}
/// Create a copy of FixtureInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FixtureStatusCopyWith<$Res> get status {
  
  return $FixtureStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [FixtureInfo].
extension FixtureInfoPatterns on FixtureInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixtureInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixtureInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixtureInfo value)  $default,){
final _that = this;
switch (_that) {
case _FixtureInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixtureInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FixtureInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String date,  String timezone,  int timestamp,  FixtureStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixtureInfo() when $default != null:
return $default(_that.id,_that.date,_that.timezone,_that.timestamp,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String date,  String timezone,  int timestamp,  FixtureStatus status)  $default,) {final _that = this;
switch (_that) {
case _FixtureInfo():
return $default(_that.id,_that.date,_that.timezone,_that.timestamp,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String date,  String timezone,  int timestamp,  FixtureStatus status)?  $default,) {final _that = this;
switch (_that) {
case _FixtureInfo() when $default != null:
return $default(_that.id,_that.date,_that.timezone,_that.timestamp,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixtureInfo implements FixtureInfo {
  const _FixtureInfo({required this.id, required this.date, required this.timezone, required this.timestamp, required this.status});
  factory _FixtureInfo.fromJson(Map<String, dynamic> json) => _$FixtureInfoFromJson(json);

@override final  int id;
@override final  String date;
@override final  String timezone;
@override final  int timestamp;
@override final  FixtureStatus status;

/// Create a copy of FixtureInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixtureInfoCopyWith<_FixtureInfo> get copyWith => __$FixtureInfoCopyWithImpl<_FixtureInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixtureInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixtureInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,timezone,timestamp,status);

@override
String toString() {
  return 'FixtureInfo(id: $id, date: $date, timezone: $timezone, timestamp: $timestamp, status: $status)';
}


}

/// @nodoc
abstract mixin class _$FixtureInfoCopyWith<$Res> implements $FixtureInfoCopyWith<$Res> {
  factory _$FixtureInfoCopyWith(_FixtureInfo value, $Res Function(_FixtureInfo) _then) = __$FixtureInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String date, String timezone, int timestamp, FixtureStatus status
});


@override $FixtureStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$FixtureInfoCopyWithImpl<$Res>
    implements _$FixtureInfoCopyWith<$Res> {
  __$FixtureInfoCopyWithImpl(this._self, this._then);

  final _FixtureInfo _self;
  final $Res Function(_FixtureInfo) _then;

/// Create a copy of FixtureInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? timezone = null,Object? timestamp = null,Object? status = null,}) {
  return _then(_FixtureInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FixtureStatus,
  ));
}

/// Create a copy of FixtureInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FixtureStatusCopyWith<$Res> get status {
  
  return $FixtureStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$FixtureStatus {

 String get long; String get short; int? get elapsed;
/// Create a copy of FixtureStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixtureStatusCopyWith<FixtureStatus> get copyWith => _$FixtureStatusCopyWithImpl<FixtureStatus>(this as FixtureStatus, _$identity);

  /// Serializes this FixtureStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixtureStatus&&(identical(other.long, long) || other.long == long)&&(identical(other.short, short) || other.short == short)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,long,short,elapsed);

@override
String toString() {
  return 'FixtureStatus(long: $long, short: $short, elapsed: $elapsed)';
}


}

/// @nodoc
abstract mixin class $FixtureStatusCopyWith<$Res>  {
  factory $FixtureStatusCopyWith(FixtureStatus value, $Res Function(FixtureStatus) _then) = _$FixtureStatusCopyWithImpl;
@useResult
$Res call({
 String long, String short, int? elapsed
});




}
/// @nodoc
class _$FixtureStatusCopyWithImpl<$Res>
    implements $FixtureStatusCopyWith<$Res> {
  _$FixtureStatusCopyWithImpl(this._self, this._then);

  final FixtureStatus _self;
  final $Res Function(FixtureStatus) _then;

/// Create a copy of FixtureStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? long = null,Object? short = null,Object? elapsed = freezed,}) {
  return _then(_self.copyWith(
long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FixtureStatus].
extension FixtureStatusPatterns on FixtureStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixtureStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixtureStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixtureStatus value)  $default,){
final _that = this;
switch (_that) {
case _FixtureStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixtureStatus value)?  $default,){
final _that = this;
switch (_that) {
case _FixtureStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String long,  String short,  int? elapsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixtureStatus() when $default != null:
return $default(_that.long,_that.short,_that.elapsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String long,  String short,  int? elapsed)  $default,) {final _that = this;
switch (_that) {
case _FixtureStatus():
return $default(_that.long,_that.short,_that.elapsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String long,  String short,  int? elapsed)?  $default,) {final _that = this;
switch (_that) {
case _FixtureStatus() when $default != null:
return $default(_that.long,_that.short,_that.elapsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixtureStatus implements FixtureStatus {
  const _FixtureStatus({required this.long, required this.short, this.elapsed});
  factory _FixtureStatus.fromJson(Map<String, dynamic> json) => _$FixtureStatusFromJson(json);

@override final  String long;
@override final  String short;
@override final  int? elapsed;

/// Create a copy of FixtureStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixtureStatusCopyWith<_FixtureStatus> get copyWith => __$FixtureStatusCopyWithImpl<_FixtureStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixtureStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixtureStatus&&(identical(other.long, long) || other.long == long)&&(identical(other.short, short) || other.short == short)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,long,short,elapsed);

@override
String toString() {
  return 'FixtureStatus(long: $long, short: $short, elapsed: $elapsed)';
}


}

/// @nodoc
abstract mixin class _$FixtureStatusCopyWith<$Res> implements $FixtureStatusCopyWith<$Res> {
  factory _$FixtureStatusCopyWith(_FixtureStatus value, $Res Function(_FixtureStatus) _then) = __$FixtureStatusCopyWithImpl;
@override @useResult
$Res call({
 String long, String short, int? elapsed
});




}
/// @nodoc
class __$FixtureStatusCopyWithImpl<$Res>
    implements _$FixtureStatusCopyWith<$Res> {
  __$FixtureStatusCopyWithImpl(this._self, this._then);

  final _FixtureStatus _self;
  final $Res Function(_FixtureStatus) _then;

/// Create a copy of FixtureStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? long = null,Object? short = null,Object? elapsed = freezed,}) {
  return _then(_FixtureStatus(
long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LeagueInfo {

 int get id; String get name; String get country; String? get logo; int? get season; String? get round;
/// Create a copy of LeagueInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueInfoCopyWith<LeagueInfo> get copyWith => _$LeagueInfoCopyWithImpl<LeagueInfo>(this as LeagueInfo, _$identity);

  /// Serializes this LeagueInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.season, season) || other.season == season)&&(identical(other.round, round) || other.round == round));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,logo,season,round);

@override
String toString() {
  return 'LeagueInfo(id: $id, name: $name, country: $country, logo: $logo, season: $season, round: $round)';
}


}

/// @nodoc
abstract mixin class $LeagueInfoCopyWith<$Res>  {
  factory $LeagueInfoCopyWith(LeagueInfo value, $Res Function(LeagueInfo) _then) = _$LeagueInfoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String country, String? logo, int? season, String? round
});




}
/// @nodoc
class _$LeagueInfoCopyWithImpl<$Res>
    implements $LeagueInfoCopyWith<$Res> {
  _$LeagueInfoCopyWithImpl(this._self, this._then);

  final LeagueInfo _self;
  final $Res Function(LeagueInfo) _then;

/// Create a copy of LeagueInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? country = null,Object? logo = freezed,Object? season = freezed,Object? round = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeagueInfo].
extension LeagueInfoPatterns on LeagueInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueInfo value)  $default,){
final _that = this;
switch (_that) {
case _LeagueInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String country,  String? logo,  int? season,  String? round)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueInfo() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.logo,_that.season,_that.round);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String country,  String? logo,  int? season,  String? round)  $default,) {final _that = this;
switch (_that) {
case _LeagueInfo():
return $default(_that.id,_that.name,_that.country,_that.logo,_that.season,_that.round);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String country,  String? logo,  int? season,  String? round)?  $default,) {final _that = this;
switch (_that) {
case _LeagueInfo() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.logo,_that.season,_that.round);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueInfo implements LeagueInfo {
  const _LeagueInfo({required this.id, required this.name, required this.country, this.logo, this.season, this.round});
  factory _LeagueInfo.fromJson(Map<String, dynamic> json) => _$LeagueInfoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String country;
@override final  String? logo;
@override final  int? season;
@override final  String? round;

/// Create a copy of LeagueInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueInfoCopyWith<_LeagueInfo> get copyWith => __$LeagueInfoCopyWithImpl<_LeagueInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.season, season) || other.season == season)&&(identical(other.round, round) || other.round == round));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,logo,season,round);

@override
String toString() {
  return 'LeagueInfo(id: $id, name: $name, country: $country, logo: $logo, season: $season, round: $round)';
}


}

/// @nodoc
abstract mixin class _$LeagueInfoCopyWith<$Res> implements $LeagueInfoCopyWith<$Res> {
  factory _$LeagueInfoCopyWith(_LeagueInfo value, $Res Function(_LeagueInfo) _then) = __$LeagueInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String country, String? logo, int? season, String? round
});




}
/// @nodoc
class __$LeagueInfoCopyWithImpl<$Res>
    implements _$LeagueInfoCopyWith<$Res> {
  __$LeagueInfoCopyWithImpl(this._self, this._then);

  final _LeagueInfo _self;
  final $Res Function(_LeagueInfo) _then;

/// Create a copy of LeagueInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? country = null,Object? logo = freezed,Object? season = freezed,Object? round = freezed,}) {
  return _then(_LeagueInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MatchTeams {

 TeamModel get home; TeamModel get away;
/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchTeamsCopyWith<MatchTeams> get copyWith => _$MatchTeamsCopyWithImpl<MatchTeams>(this as MatchTeams, _$identity);

  /// Serializes this MatchTeams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchTeams&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'MatchTeams(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class $MatchTeamsCopyWith<$Res>  {
  factory $MatchTeamsCopyWith(MatchTeams value, $Res Function(MatchTeams) _then) = _$MatchTeamsCopyWithImpl;
@useResult
$Res call({
 TeamModel home, TeamModel away
});


$TeamModelCopyWith<$Res> get home;$TeamModelCopyWith<$Res> get away;

}
/// @nodoc
class _$MatchTeamsCopyWithImpl<$Res>
    implements $MatchTeamsCopyWith<$Res> {
  _$MatchTeamsCopyWithImpl(this._self, this._then);

  final MatchTeams _self;
  final $Res Function(MatchTeams) _then;

/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = null,Object? away = null,}) {
  return _then(_self.copyWith(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as TeamModel,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as TeamModel,
  ));
}
/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get home {
  
  return $TeamModelCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get away {
  
  return $TeamModelCopyWith<$Res>(_self.away, (value) {
    return _then(_self.copyWith(away: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchTeams].
extension MatchTeamsPatterns on MatchTeams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchTeams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchTeams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchTeams value)  $default,){
final _that = this;
switch (_that) {
case _MatchTeams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchTeams value)?  $default,){
final _that = this;
switch (_that) {
case _MatchTeams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TeamModel home,  TeamModel away)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchTeams() when $default != null:
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TeamModel home,  TeamModel away)  $default,) {final _that = this;
switch (_that) {
case _MatchTeams():
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TeamModel home,  TeamModel away)?  $default,) {final _that = this;
switch (_that) {
case _MatchTeams() when $default != null:
return $default(_that.home,_that.away);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchTeams implements MatchTeams {
  const _MatchTeams({required this.home, required this.away});
  factory _MatchTeams.fromJson(Map<String, dynamic> json) => _$MatchTeamsFromJson(json);

@override final  TeamModel home;
@override final  TeamModel away;

/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchTeamsCopyWith<_MatchTeams> get copyWith => __$MatchTeamsCopyWithImpl<_MatchTeams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchTeamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchTeams&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'MatchTeams(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class _$MatchTeamsCopyWith<$Res> implements $MatchTeamsCopyWith<$Res> {
  factory _$MatchTeamsCopyWith(_MatchTeams value, $Res Function(_MatchTeams) _then) = __$MatchTeamsCopyWithImpl;
@override @useResult
$Res call({
 TeamModel home, TeamModel away
});


@override $TeamModelCopyWith<$Res> get home;@override $TeamModelCopyWith<$Res> get away;

}
/// @nodoc
class __$MatchTeamsCopyWithImpl<$Res>
    implements _$MatchTeamsCopyWith<$Res> {
  __$MatchTeamsCopyWithImpl(this._self, this._then);

  final _MatchTeams _self;
  final $Res Function(_MatchTeams) _then;

/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = null,Object? away = null,}) {
  return _then(_MatchTeams(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as TeamModel,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as TeamModel,
  ));
}

/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get home {
  
  return $TeamModelCopyWith<$Res>(_self.home, (value) {
    return _then(_self.copyWith(home: value));
  });
}/// Create a copy of MatchTeams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get away {
  
  return $TeamModelCopyWith<$Res>(_self.away, (value) {
    return _then(_self.copyWith(away: value));
  });
}
}


/// @nodoc
mixin _$MatchGoals {

 int? get home; int? get away;
/// Create a copy of MatchGoals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<MatchGoals> get copyWith => _$MatchGoalsCopyWithImpl<MatchGoals>(this as MatchGoals, _$identity);

  /// Serializes this MatchGoals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchGoals&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'MatchGoals(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class $MatchGoalsCopyWith<$Res>  {
  factory $MatchGoalsCopyWith(MatchGoals value, $Res Function(MatchGoals) _then) = _$MatchGoalsCopyWithImpl;
@useResult
$Res call({
 int? home, int? away
});




}
/// @nodoc
class _$MatchGoalsCopyWithImpl<$Res>
    implements $MatchGoalsCopyWith<$Res> {
  _$MatchGoalsCopyWithImpl(this._self, this._then);

  final MatchGoals _self;
  final $Res Function(MatchGoals) _then;

/// Create a copy of MatchGoals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = freezed,Object? away = freezed,}) {
  return _then(_self.copyWith(
home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as int?,away: freezed == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchGoals].
extension MatchGoalsPatterns on MatchGoals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchGoals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchGoals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchGoals value)  $default,){
final _that = this;
switch (_that) {
case _MatchGoals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchGoals value)?  $default,){
final _that = this;
switch (_that) {
case _MatchGoals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? home,  int? away)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchGoals() when $default != null:
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? home,  int? away)  $default,) {final _that = this;
switch (_that) {
case _MatchGoals():
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? home,  int? away)?  $default,) {final _that = this;
switch (_that) {
case _MatchGoals() when $default != null:
return $default(_that.home,_that.away);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchGoals implements MatchGoals {
  const _MatchGoals({this.home, this.away});
  factory _MatchGoals.fromJson(Map<String, dynamic> json) => _$MatchGoalsFromJson(json);

@override final  int? home;
@override final  int? away;

/// Create a copy of MatchGoals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchGoalsCopyWith<_MatchGoals> get copyWith => __$MatchGoalsCopyWithImpl<_MatchGoals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchGoalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchGoals&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);

@override
String toString() {
  return 'MatchGoals(home: $home, away: $away)';
}


}

/// @nodoc
abstract mixin class _$MatchGoalsCopyWith<$Res> implements $MatchGoalsCopyWith<$Res> {
  factory _$MatchGoalsCopyWith(_MatchGoals value, $Res Function(_MatchGoals) _then) = __$MatchGoalsCopyWithImpl;
@override @useResult
$Res call({
 int? home, int? away
});




}
/// @nodoc
class __$MatchGoalsCopyWithImpl<$Res>
    implements _$MatchGoalsCopyWith<$Res> {
  __$MatchGoalsCopyWithImpl(this._self, this._then);

  final _MatchGoals _self;
  final $Res Function(_MatchGoals) _then;

/// Create a copy of MatchGoals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = freezed,Object? away = freezed,}) {
  return _then(_MatchGoals(
home: freezed == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as int?,away: freezed == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MatchScore {

 MatchGoals? get halftime; MatchGoals? get fulltime; MatchGoals? get extratime; MatchGoals? get penalty;
/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchScoreCopyWith<MatchScore> get copyWith => _$MatchScoreCopyWithImpl<MatchScore>(this as MatchScore, _$identity);

  /// Serializes this MatchScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchScore&&(identical(other.halftime, halftime) || other.halftime == halftime)&&(identical(other.fulltime, fulltime) || other.fulltime == fulltime)&&(identical(other.extratime, extratime) || other.extratime == extratime)&&(identical(other.penalty, penalty) || other.penalty == penalty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,halftime,fulltime,extratime,penalty);

@override
String toString() {
  return 'MatchScore(halftime: $halftime, fulltime: $fulltime, extratime: $extratime, penalty: $penalty)';
}


}

/// @nodoc
abstract mixin class $MatchScoreCopyWith<$Res>  {
  factory $MatchScoreCopyWith(MatchScore value, $Res Function(MatchScore) _then) = _$MatchScoreCopyWithImpl;
@useResult
$Res call({
 MatchGoals? halftime, MatchGoals? fulltime, MatchGoals? extratime, MatchGoals? penalty
});


$MatchGoalsCopyWith<$Res>? get halftime;$MatchGoalsCopyWith<$Res>? get fulltime;$MatchGoalsCopyWith<$Res>? get extratime;$MatchGoalsCopyWith<$Res>? get penalty;

}
/// @nodoc
class _$MatchScoreCopyWithImpl<$Res>
    implements $MatchScoreCopyWith<$Res> {
  _$MatchScoreCopyWithImpl(this._self, this._then);

  final MatchScore _self;
  final $Res Function(MatchScore) _then;

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? halftime = freezed,Object? fulltime = freezed,Object? extratime = freezed,Object? penalty = freezed,}) {
  return _then(_self.copyWith(
halftime: freezed == halftime ? _self.halftime : halftime // ignore: cast_nullable_to_non_nullable
as MatchGoals?,fulltime: freezed == fulltime ? _self.fulltime : fulltime // ignore: cast_nullable_to_non_nullable
as MatchGoals?,extratime: freezed == extratime ? _self.extratime : extratime // ignore: cast_nullable_to_non_nullable
as MatchGoals?,penalty: freezed == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as MatchGoals?,
  ));
}
/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get halftime {
    if (_self.halftime == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.halftime!, (value) {
    return _then(_self.copyWith(halftime: value));
  });
}/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get fulltime {
    if (_self.fulltime == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.fulltime!, (value) {
    return _then(_self.copyWith(fulltime: value));
  });
}/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get extratime {
    if (_self.extratime == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.extratime!, (value) {
    return _then(_self.copyWith(extratime: value));
  });
}/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get penalty {
    if (_self.penalty == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.penalty!, (value) {
    return _then(_self.copyWith(penalty: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchScore].
extension MatchScorePatterns on MatchScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchScore value)  $default,){
final _that = this;
switch (_that) {
case _MatchScore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchScore value)?  $default,){
final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MatchGoals? halftime,  MatchGoals? fulltime,  MatchGoals? extratime,  MatchGoals? penalty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
return $default(_that.halftime,_that.fulltime,_that.extratime,_that.penalty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MatchGoals? halftime,  MatchGoals? fulltime,  MatchGoals? extratime,  MatchGoals? penalty)  $default,) {final _that = this;
switch (_that) {
case _MatchScore():
return $default(_that.halftime,_that.fulltime,_that.extratime,_that.penalty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MatchGoals? halftime,  MatchGoals? fulltime,  MatchGoals? extratime,  MatchGoals? penalty)?  $default,) {final _that = this;
switch (_that) {
case _MatchScore() when $default != null:
return $default(_that.halftime,_that.fulltime,_that.extratime,_that.penalty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchScore implements MatchScore {
  const _MatchScore({this.halftime, this.fulltime, this.extratime, this.penalty});
  factory _MatchScore.fromJson(Map<String, dynamic> json) => _$MatchScoreFromJson(json);

@override final  MatchGoals? halftime;
@override final  MatchGoals? fulltime;
@override final  MatchGoals? extratime;
@override final  MatchGoals? penalty;

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchScoreCopyWith<_MatchScore> get copyWith => __$MatchScoreCopyWithImpl<_MatchScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchScore&&(identical(other.halftime, halftime) || other.halftime == halftime)&&(identical(other.fulltime, fulltime) || other.fulltime == fulltime)&&(identical(other.extratime, extratime) || other.extratime == extratime)&&(identical(other.penalty, penalty) || other.penalty == penalty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,halftime,fulltime,extratime,penalty);

@override
String toString() {
  return 'MatchScore(halftime: $halftime, fulltime: $fulltime, extratime: $extratime, penalty: $penalty)';
}


}

/// @nodoc
abstract mixin class _$MatchScoreCopyWith<$Res> implements $MatchScoreCopyWith<$Res> {
  factory _$MatchScoreCopyWith(_MatchScore value, $Res Function(_MatchScore) _then) = __$MatchScoreCopyWithImpl;
@override @useResult
$Res call({
 MatchGoals? halftime, MatchGoals? fulltime, MatchGoals? extratime, MatchGoals? penalty
});


@override $MatchGoalsCopyWith<$Res>? get halftime;@override $MatchGoalsCopyWith<$Res>? get fulltime;@override $MatchGoalsCopyWith<$Res>? get extratime;@override $MatchGoalsCopyWith<$Res>? get penalty;

}
/// @nodoc
class __$MatchScoreCopyWithImpl<$Res>
    implements _$MatchScoreCopyWith<$Res> {
  __$MatchScoreCopyWithImpl(this._self, this._then);

  final _MatchScore _self;
  final $Res Function(_MatchScore) _then;

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? halftime = freezed,Object? fulltime = freezed,Object? extratime = freezed,Object? penalty = freezed,}) {
  return _then(_MatchScore(
halftime: freezed == halftime ? _self.halftime : halftime // ignore: cast_nullable_to_non_nullable
as MatchGoals?,fulltime: freezed == fulltime ? _self.fulltime : fulltime // ignore: cast_nullable_to_non_nullable
as MatchGoals?,extratime: freezed == extratime ? _self.extratime : extratime // ignore: cast_nullable_to_non_nullable
as MatchGoals?,penalty: freezed == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as MatchGoals?,
  ));
}

/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get halftime {
    if (_self.halftime == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.halftime!, (value) {
    return _then(_self.copyWith(halftime: value));
  });
}/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get fulltime {
    if (_self.fulltime == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.fulltime!, (value) {
    return _then(_self.copyWith(fulltime: value));
  });
}/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get extratime {
    if (_self.extratime == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.extratime!, (value) {
    return _then(_self.copyWith(extratime: value));
  });
}/// Create a copy of MatchScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res>? get penalty {
    if (_self.penalty == null) {
    return null;
  }

  return $MatchGoalsCopyWith<$Res>(_self.penalty!, (value) {
    return _then(_self.copyWith(penalty: value));
  });
}
}


/// @nodoc
mixin _$FixtureModel {

 FixtureInfo get fixture; LeagueInfo get league; MatchTeams get teams; MatchGoals get goals; MatchScore get score;
/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixtureModelCopyWith<FixtureModel> get copyWith => _$FixtureModelCopyWithImpl<FixtureModel>(this as FixtureModel, _$identity);

  /// Serializes this FixtureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixtureModel&&(identical(other.fixture, fixture) || other.fixture == fixture)&&(identical(other.league, league) || other.league == league)&&(identical(other.teams, teams) || other.teams == teams)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fixture,league,teams,goals,score);

@override
String toString() {
  return 'FixtureModel(fixture: $fixture, league: $league, teams: $teams, goals: $goals, score: $score)';
}


}

/// @nodoc
abstract mixin class $FixtureModelCopyWith<$Res>  {
  factory $FixtureModelCopyWith(FixtureModel value, $Res Function(FixtureModel) _then) = _$FixtureModelCopyWithImpl;
@useResult
$Res call({
 FixtureInfo fixture, LeagueInfo league, MatchTeams teams, MatchGoals goals, MatchScore score
});


$FixtureInfoCopyWith<$Res> get fixture;$LeagueInfoCopyWith<$Res> get league;$MatchTeamsCopyWith<$Res> get teams;$MatchGoalsCopyWith<$Res> get goals;$MatchScoreCopyWith<$Res> get score;

}
/// @nodoc
class _$FixtureModelCopyWithImpl<$Res>
    implements $FixtureModelCopyWith<$Res> {
  _$FixtureModelCopyWithImpl(this._self, this._then);

  final FixtureModel _self;
  final $Res Function(FixtureModel) _then;

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fixture = null,Object? league = null,Object? teams = null,Object? goals = null,Object? score = null,}) {
  return _then(_self.copyWith(
fixture: null == fixture ? _self.fixture : fixture // ignore: cast_nullable_to_non_nullable
as FixtureInfo,league: null == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as LeagueInfo,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as MatchTeams,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as MatchGoals,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as MatchScore,
  ));
}
/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FixtureInfoCopyWith<$Res> get fixture {
  
  return $FixtureInfoCopyWith<$Res>(_self.fixture, (value) {
    return _then(_self.copyWith(fixture: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueInfoCopyWith<$Res> get league {
  
  return $LeagueInfoCopyWith<$Res>(_self.league, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamsCopyWith<$Res> get teams {
  
  return $MatchTeamsCopyWith<$Res>(_self.teams, (value) {
    return _then(_self.copyWith(teams: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res> get goals {
  
  return $MatchGoalsCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchScoreCopyWith<$Res> get score {
  
  return $MatchScoreCopyWith<$Res>(_self.score, (value) {
    return _then(_self.copyWith(score: value));
  });
}
}


/// Adds pattern-matching-related methods to [FixtureModel].
extension FixtureModelPatterns on FixtureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixtureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixtureModel value)  $default,){
final _that = this;
switch (_that) {
case _FixtureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixtureModel value)?  $default,){
final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FixtureInfo fixture,  LeagueInfo league,  MatchTeams teams,  MatchGoals goals,  MatchScore score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
return $default(_that.fixture,_that.league,_that.teams,_that.goals,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FixtureInfo fixture,  LeagueInfo league,  MatchTeams teams,  MatchGoals goals,  MatchScore score)  $default,) {final _that = this;
switch (_that) {
case _FixtureModel():
return $default(_that.fixture,_that.league,_that.teams,_that.goals,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FixtureInfo fixture,  LeagueInfo league,  MatchTeams teams,  MatchGoals goals,  MatchScore score)?  $default,) {final _that = this;
switch (_that) {
case _FixtureModel() when $default != null:
return $default(_that.fixture,_that.league,_that.teams,_that.goals,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixtureModel implements FixtureModel {
  const _FixtureModel({required this.fixture, required this.league, required this.teams, required this.goals, required this.score});
  factory _FixtureModel.fromJson(Map<String, dynamic> json) => _$FixtureModelFromJson(json);

@override final  FixtureInfo fixture;
@override final  LeagueInfo league;
@override final  MatchTeams teams;
@override final  MatchGoals goals;
@override final  MatchScore score;

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixtureModelCopyWith<_FixtureModel> get copyWith => __$FixtureModelCopyWithImpl<_FixtureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixtureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixtureModel&&(identical(other.fixture, fixture) || other.fixture == fixture)&&(identical(other.league, league) || other.league == league)&&(identical(other.teams, teams) || other.teams == teams)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fixture,league,teams,goals,score);

@override
String toString() {
  return 'FixtureModel(fixture: $fixture, league: $league, teams: $teams, goals: $goals, score: $score)';
}


}

/// @nodoc
abstract mixin class _$FixtureModelCopyWith<$Res> implements $FixtureModelCopyWith<$Res> {
  factory _$FixtureModelCopyWith(_FixtureModel value, $Res Function(_FixtureModel) _then) = __$FixtureModelCopyWithImpl;
@override @useResult
$Res call({
 FixtureInfo fixture, LeagueInfo league, MatchTeams teams, MatchGoals goals, MatchScore score
});


@override $FixtureInfoCopyWith<$Res> get fixture;@override $LeagueInfoCopyWith<$Res> get league;@override $MatchTeamsCopyWith<$Res> get teams;@override $MatchGoalsCopyWith<$Res> get goals;@override $MatchScoreCopyWith<$Res> get score;

}
/// @nodoc
class __$FixtureModelCopyWithImpl<$Res>
    implements _$FixtureModelCopyWith<$Res> {
  __$FixtureModelCopyWithImpl(this._self, this._then);

  final _FixtureModel _self;
  final $Res Function(_FixtureModel) _then;

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fixture = null,Object? league = null,Object? teams = null,Object? goals = null,Object? score = null,}) {
  return _then(_FixtureModel(
fixture: null == fixture ? _self.fixture : fixture // ignore: cast_nullable_to_non_nullable
as FixtureInfo,league: null == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as LeagueInfo,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as MatchTeams,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as MatchGoals,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as MatchScore,
  ));
}

/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FixtureInfoCopyWith<$Res> get fixture {
  
  return $FixtureInfoCopyWith<$Res>(_self.fixture, (value) {
    return _then(_self.copyWith(fixture: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueInfoCopyWith<$Res> get league {
  
  return $LeagueInfoCopyWith<$Res>(_self.league, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamsCopyWith<$Res> get teams {
  
  return $MatchTeamsCopyWith<$Res>(_self.teams, (value) {
    return _then(_self.copyWith(teams: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchGoalsCopyWith<$Res> get goals {
  
  return $MatchGoalsCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}/// Create a copy of FixtureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchScoreCopyWith<$Res> get score {
  
  return $MatchScoreCopyWith<$Res>(_self.score, (value) {
    return _then(_self.copyWith(score: value));
  });
}
}

// dart format on
