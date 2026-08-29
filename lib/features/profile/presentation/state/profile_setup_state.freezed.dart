// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileSetupState {

 String get displayName; DateTime? get birthDate; String get countryCode; String get city; String get locale; bool get voiceAssistanceEnabled; bool get isLoading; String? get error; bool get isSuccess;
/// Create a copy of ProfileSetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSetupStateCopyWith<ProfileSetupState> get copyWith => _$ProfileSetupStateCopyWithImpl<ProfileSetupState>(this as ProfileSetupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSetupState&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.voiceAssistanceEnabled, voiceAssistanceEnabled) || other.voiceAssistanceEnabled == voiceAssistanceEnabled)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,birthDate,countryCode,city,locale,voiceAssistanceEnabled,isLoading,error,isSuccess);

@override
String toString() {
  return 'ProfileSetupState(displayName: $displayName, birthDate: $birthDate, countryCode: $countryCode, city: $city, locale: $locale, voiceAssistanceEnabled: $voiceAssistanceEnabled, isLoading: $isLoading, error: $error, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ProfileSetupStateCopyWith<$Res>  {
  factory $ProfileSetupStateCopyWith(ProfileSetupState value, $Res Function(ProfileSetupState) _then) = _$ProfileSetupStateCopyWithImpl;
@useResult
$Res call({
 String displayName, DateTime? birthDate, String countryCode, String city, String locale, bool voiceAssistanceEnabled, bool isLoading, String? error, bool isSuccess
});




}
/// @nodoc
class _$ProfileSetupStateCopyWithImpl<$Res>
    implements $ProfileSetupStateCopyWith<$Res> {
  _$ProfileSetupStateCopyWithImpl(this._self, this._then);

  final ProfileSetupState _self;
  final $Res Function(ProfileSetupState) _then;

/// Create a copy of ProfileSetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? birthDate = freezed,Object? countryCode = null,Object? city = null,Object? locale = null,Object? voiceAssistanceEnabled = null,Object? isLoading = null,Object? error = freezed,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,voiceAssistanceEnabled: null == voiceAssistanceEnabled ? _self.voiceAssistanceEnabled : voiceAssistanceEnabled // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileSetupState].
extension ProfileSetupStatePatterns on ProfileSetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSetupState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSetupState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  DateTime? birthDate,  String countryCode,  String city,  String locale,  bool voiceAssistanceEnabled,  bool isLoading,  String? error,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSetupState() when $default != null:
return $default(_that.displayName,_that.birthDate,_that.countryCode,_that.city,_that.locale,_that.voiceAssistanceEnabled,_that.isLoading,_that.error,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  DateTime? birthDate,  String countryCode,  String city,  String locale,  bool voiceAssistanceEnabled,  bool isLoading,  String? error,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ProfileSetupState():
return $default(_that.displayName,_that.birthDate,_that.countryCode,_that.city,_that.locale,_that.voiceAssistanceEnabled,_that.isLoading,_that.error,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  DateTime? birthDate,  String countryCode,  String city,  String locale,  bool voiceAssistanceEnabled,  bool isLoading,  String? error,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSetupState() when $default != null:
return $default(_that.displayName,_that.birthDate,_that.countryCode,_that.city,_that.locale,_that.voiceAssistanceEnabled,_that.isLoading,_that.error,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileSetupState implements ProfileSetupState {
  const _ProfileSetupState({this.displayName = '', this.birthDate, this.countryCode = 'CI', this.city = '', this.locale = 'fr', this.voiceAssistanceEnabled = false, this.isLoading = false, this.error, this.isSuccess = false});
  

@override@JsonKey() final  String displayName;
@override final  DateTime? birthDate;
@override@JsonKey() final  String countryCode;
@override@JsonKey() final  String city;
@override@JsonKey() final  String locale;
@override@JsonKey() final  bool voiceAssistanceEnabled;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ProfileSetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSetupStateCopyWith<_ProfileSetupState> get copyWith => __$ProfileSetupStateCopyWithImpl<_ProfileSetupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSetupState&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.voiceAssistanceEnabled, voiceAssistanceEnabled) || other.voiceAssistanceEnabled == voiceAssistanceEnabled)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,birthDate,countryCode,city,locale,voiceAssistanceEnabled,isLoading,error,isSuccess);

@override
String toString() {
  return 'ProfileSetupState(displayName: $displayName, birthDate: $birthDate, countryCode: $countryCode, city: $city, locale: $locale, voiceAssistanceEnabled: $voiceAssistanceEnabled, isLoading: $isLoading, error: $error, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ProfileSetupStateCopyWith<$Res> implements $ProfileSetupStateCopyWith<$Res> {
  factory _$ProfileSetupStateCopyWith(_ProfileSetupState value, $Res Function(_ProfileSetupState) _then) = __$ProfileSetupStateCopyWithImpl;
@override @useResult
$Res call({
 String displayName, DateTime? birthDate, String countryCode, String city, String locale, bool voiceAssistanceEnabled, bool isLoading, String? error, bool isSuccess
});




}
/// @nodoc
class __$ProfileSetupStateCopyWithImpl<$Res>
    implements _$ProfileSetupStateCopyWith<$Res> {
  __$ProfileSetupStateCopyWithImpl(this._self, this._then);

  final _ProfileSetupState _self;
  final $Res Function(_ProfileSetupState) _then;

/// Create a copy of ProfileSetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? birthDate = freezed,Object? countryCode = null,Object? city = null,Object? locale = null,Object? voiceAssistanceEnabled = null,Object? isLoading = null,Object? error = freezed,Object? isSuccess = null,}) {
  return _then(_ProfileSetupState(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,voiceAssistanceEnabled: null == voiceAssistanceEnabled ? _self.voiceAssistanceEnabled : voiceAssistanceEnabled // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
