// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gestational_age.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GestationalAge {

@JsonKey(name: 'total_days') int get totalDays; int get weeks; int get days;
/// Create a copy of GestationalAge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GestationalAgeCopyWith<GestationalAge> get copyWith => _$GestationalAgeCopyWithImpl<GestationalAge>(this as GestationalAge, _$identity);

  /// Serializes this GestationalAge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GestationalAge&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&(identical(other.days, days) || other.days == days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,weeks,days);

@override
String toString() {
  return 'GestationalAge(totalDays: $totalDays, weeks: $weeks, days: $days)';
}


}

/// @nodoc
abstract mixin class $GestationalAgeCopyWith<$Res>  {
  factory $GestationalAgeCopyWith(GestationalAge value, $Res Function(GestationalAge) _then) = _$GestationalAgeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_days') int totalDays, int weeks, int days
});




}
/// @nodoc
class _$GestationalAgeCopyWithImpl<$Res>
    implements $GestationalAgeCopyWith<$Res> {
  _$GestationalAgeCopyWithImpl(this._self, this._then);

  final GestationalAge _self;
  final $Res Function(GestationalAge) _then;

/// Create a copy of GestationalAge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDays = null,Object? weeks = null,Object? days = null,}) {
  return _then(_self.copyWith(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GestationalAge].
extension GestationalAgePatterns on GestationalAge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GestationalAge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GestationalAge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GestationalAge value)  $default,){
final _that = this;
switch (_that) {
case _GestationalAge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GestationalAge value)?  $default,){
final _that = this;
switch (_that) {
case _GestationalAge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_days')  int totalDays,  int weeks,  int days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GestationalAge() when $default != null:
return $default(_that.totalDays,_that.weeks,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_days')  int totalDays,  int weeks,  int days)  $default,) {final _that = this;
switch (_that) {
case _GestationalAge():
return $default(_that.totalDays,_that.weeks,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_days')  int totalDays,  int weeks,  int days)?  $default,) {final _that = this;
switch (_that) {
case _GestationalAge() when $default != null:
return $default(_that.totalDays,_that.weeks,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GestationalAge implements GestationalAge {
  const _GestationalAge({@JsonKey(name: 'total_days') required this.totalDays, required this.weeks, required this.days});
  factory _GestationalAge.fromJson(Map<String, dynamic> json) => _$GestationalAgeFromJson(json);

@override@JsonKey(name: 'total_days') final  int totalDays;
@override final  int weeks;
@override final  int days;

/// Create a copy of GestationalAge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GestationalAgeCopyWith<_GestationalAge> get copyWith => __$GestationalAgeCopyWithImpl<_GestationalAge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GestationalAgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GestationalAge&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&(identical(other.days, days) || other.days == days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,weeks,days);

@override
String toString() {
  return 'GestationalAge(totalDays: $totalDays, weeks: $weeks, days: $days)';
}


}

/// @nodoc
abstract mixin class _$GestationalAgeCopyWith<$Res> implements $GestationalAgeCopyWith<$Res> {
  factory _$GestationalAgeCopyWith(_GestationalAge value, $Res Function(_GestationalAge) _then) = __$GestationalAgeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_days') int totalDays, int weeks, int days
});




}
/// @nodoc
class __$GestationalAgeCopyWithImpl<$Res>
    implements _$GestationalAgeCopyWith<$Res> {
  __$GestationalAgeCopyWithImpl(this._self, this._then);

  final _GestationalAge _self;
  final $Res Function(_GestationalAge) _then;

/// Create a copy of GestationalAge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDays = null,Object? weeks = null,Object? days = null,}) {
  return _then(_GestationalAge(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
