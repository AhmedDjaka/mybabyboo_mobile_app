// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'birth_date') String? get birthDate;@JsonKey(name: 'country_code') String get countryCode; String? get city; String get locale;@JsonKey(name: 'voice_assistance_enabled') bool get voiceAssistanceEnabled;@JsonKey(name: 'profile_completed') bool get profileCompleted;@JsonKey(name: 'profile_completed_at') String? get profileCompletedAt;
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<UserProfileModel> get copyWith => _$UserProfileModelCopyWithImpl<UserProfileModel>(this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.voiceAssistanceEnabled, voiceAssistanceEnabled) || other.voiceAssistanceEnabled == voiceAssistanceEnabled)&&(identical(other.profileCompleted, profileCompleted) || other.profileCompleted == profileCompleted)&&(identical(other.profileCompletedAt, profileCompletedAt) || other.profileCompletedAt == profileCompletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,displayName,birthDate,countryCode,city,locale,voiceAssistanceEnabled,profileCompleted,profileCompletedAt);

@override
String toString() {
  return 'UserProfileModel(id: $id, userId: $userId, displayName: $displayName, birthDate: $birthDate, countryCode: $countryCode, city: $city, locale: $locale, voiceAssistanceEnabled: $voiceAssistanceEnabled, profileCompleted: $profileCompleted, profileCompletedAt: $profileCompletedAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res>  {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) _then) = _$UserProfileModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'country_code') String countryCode, String? city, String locale,@JsonKey(name: 'voice_assistance_enabled') bool voiceAssistanceEnabled,@JsonKey(name: 'profile_completed') bool profileCompleted,@JsonKey(name: 'profile_completed_at') String? profileCompletedAt
});




}
/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? displayName = null,Object? birthDate = freezed,Object? countryCode = null,Object? city = freezed,Object? locale = null,Object? voiceAssistanceEnabled = null,Object? profileCompleted = null,Object? profileCompletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,voiceAssistanceEnabled: null == voiceAssistanceEnabled ? _self.voiceAssistanceEnabled : voiceAssistanceEnabled // ignore: cast_nullable_to_non_nullable
as bool,profileCompleted: null == profileCompleted ? _self.profileCompleted : profileCompleted // ignore: cast_nullable_to_non_nullable
as bool,profileCompletedAt: freezed == profileCompletedAt ? _self.profileCompletedAt : profileCompletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileModel].
extension UserProfileModelPatterns on UserProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'country_code')  String countryCode,  String? city,  String locale, @JsonKey(name: 'voice_assistance_enabled')  bool voiceAssistanceEnabled, @JsonKey(name: 'profile_completed')  bool profileCompleted, @JsonKey(name: 'profile_completed_at')  String? profileCompletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.id,_that.userId,_that.displayName,_that.birthDate,_that.countryCode,_that.city,_that.locale,_that.voiceAssistanceEnabled,_that.profileCompleted,_that.profileCompletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'country_code')  String countryCode,  String? city,  String locale, @JsonKey(name: 'voice_assistance_enabled')  bool voiceAssistanceEnabled, @JsonKey(name: 'profile_completed')  bool profileCompleted, @JsonKey(name: 'profile_completed_at')  String? profileCompletedAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel():
return $default(_that.id,_that.userId,_that.displayName,_that.birthDate,_that.countryCode,_that.city,_that.locale,_that.voiceAssistanceEnabled,_that.profileCompleted,_that.profileCompletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'country_code')  String countryCode,  String? city,  String locale, @JsonKey(name: 'voice_assistance_enabled')  bool voiceAssistanceEnabled, @JsonKey(name: 'profile_completed')  bool profileCompleted, @JsonKey(name: 'profile_completed_at')  String? profileCompletedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.id,_that.userId,_that.displayName,_that.birthDate,_that.countryCode,_that.city,_that.locale,_that.voiceAssistanceEnabled,_that.profileCompleted,_that.profileCompletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileModel implements UserProfileModel {
  const _UserProfileModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'birth_date') this.birthDate, @JsonKey(name: 'country_code') this.countryCode = 'CI', this.city, this.locale = 'fr', @JsonKey(name: 'voice_assistance_enabled') this.voiceAssistanceEnabled = false, @JsonKey(name: 'profile_completed') this.profileCompleted = false, @JsonKey(name: 'profile_completed_at') this.profileCompletedAt});
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'birth_date') final  String? birthDate;
@override@JsonKey(name: 'country_code') final  String countryCode;
@override final  String? city;
@override@JsonKey() final  String locale;
@override@JsonKey(name: 'voice_assistance_enabled') final  bool voiceAssistanceEnabled;
@override@JsonKey(name: 'profile_completed') final  bool profileCompleted;
@override@JsonKey(name: 'profile_completed_at') final  String? profileCompletedAt;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileModelCopyWith<_UserProfileModel> get copyWith => __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.voiceAssistanceEnabled, voiceAssistanceEnabled) || other.voiceAssistanceEnabled == voiceAssistanceEnabled)&&(identical(other.profileCompleted, profileCompleted) || other.profileCompleted == profileCompleted)&&(identical(other.profileCompletedAt, profileCompletedAt) || other.profileCompletedAt == profileCompletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,displayName,birthDate,countryCode,city,locale,voiceAssistanceEnabled,profileCompleted,profileCompletedAt);

@override
String toString() {
  return 'UserProfileModel(id: $id, userId: $userId, displayName: $displayName, birthDate: $birthDate, countryCode: $countryCode, city: $city, locale: $locale, voiceAssistanceEnabled: $voiceAssistanceEnabled, profileCompleted: $profileCompleted, profileCompletedAt: $profileCompletedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(_UserProfileModel value, $Res Function(_UserProfileModel) _then) = __$UserProfileModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'country_code') String countryCode, String? city, String locale,@JsonKey(name: 'voice_assistance_enabled') bool voiceAssistanceEnabled,@JsonKey(name: 'profile_completed') bool profileCompleted,@JsonKey(name: 'profile_completed_at') String? profileCompletedAt
});




}
/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? displayName = null,Object? birthDate = freezed,Object? countryCode = null,Object? city = freezed,Object? locale = null,Object? voiceAssistanceEnabled = null,Object? profileCompleted = null,Object? profileCompletedAt = freezed,}) {
  return _then(_UserProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,voiceAssistanceEnabled: null == voiceAssistanceEnabled ? _self.voiceAssistanceEnabled : voiceAssistanceEnabled // ignore: cast_nullable_to_non_nullable
as bool,profileCompleted: null == profileCompleted ? _self.profileCompleted : profileCompleted // ignore: cast_nullable_to_non_nullable
as bool,profileCompletedAt: freezed == profileCompletedAt ? _self.profileCompletedAt : profileCompletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
