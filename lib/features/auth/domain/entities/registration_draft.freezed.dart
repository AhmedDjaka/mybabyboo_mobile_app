// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegistrationDraft {

 String get firstName; String get lastName; String get phone; String get verificationId; String get destinationMasked; int get expiresIn; String get password; String get email; bool get acceptedTerms; String get verificationToken;
/// Create a copy of RegistrationDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationDraftCopyWith<RegistrationDraft> get copyWith => _$RegistrationDraftCopyWithImpl<RegistrationDraft>(this as RegistrationDraft, _$identity);

  /// Serializes this RegistrationDraft to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationDraft&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.destinationMasked, destinationMasked) || other.destinationMasked == destinationMasked)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email)&&(identical(other.acceptedTerms, acceptedTerms) || other.acceptedTerms == acceptedTerms)&&(identical(other.verificationToken, verificationToken) || other.verificationToken == verificationToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,verificationId,destinationMasked,expiresIn,password,email,acceptedTerms,verificationToken);

@override
String toString() {
  return 'RegistrationDraft(firstName: $firstName, lastName: $lastName, phone: $phone, verificationId: $verificationId, destinationMasked: $destinationMasked, expiresIn: $expiresIn, password: $password, email: $email, acceptedTerms: $acceptedTerms, verificationToken: $verificationToken)';
}


}

/// @nodoc
abstract mixin class $RegistrationDraftCopyWith<$Res>  {
  factory $RegistrationDraftCopyWith(RegistrationDraft value, $Res Function(RegistrationDraft) _then) = _$RegistrationDraftCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String phone, String verificationId, String destinationMasked, int expiresIn, String password, String email, bool acceptedTerms, String verificationToken
});




}
/// @nodoc
class _$RegistrationDraftCopyWithImpl<$Res>
    implements $RegistrationDraftCopyWith<$Res> {
  _$RegistrationDraftCopyWithImpl(this._self, this._then);

  final RegistrationDraft _self;
  final $Res Function(RegistrationDraft) _then;

/// Create a copy of RegistrationDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? phone = null,Object? verificationId = null,Object? destinationMasked = null,Object? expiresIn = null,Object? password = null,Object? email = null,Object? acceptedTerms = null,Object? verificationToken = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,destinationMasked: null == destinationMasked ? _self.destinationMasked : destinationMasked // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,acceptedTerms: null == acceptedTerms ? _self.acceptedTerms : acceptedTerms // ignore: cast_nullable_to_non_nullable
as bool,verificationToken: null == verificationToken ? _self.verificationToken : verificationToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationDraft].
extension RegistrationDraftPatterns on RegistrationDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationDraft value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationDraft value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String phone,  String verificationId,  String destinationMasked,  int expiresIn,  String password,  String email,  bool acceptedTerms,  String verificationToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationDraft() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.verificationId,_that.destinationMasked,_that.expiresIn,_that.password,_that.email,_that.acceptedTerms,_that.verificationToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String phone,  String verificationId,  String destinationMasked,  int expiresIn,  String password,  String email,  bool acceptedTerms,  String verificationToken)  $default,) {final _that = this;
switch (_that) {
case _RegistrationDraft():
return $default(_that.firstName,_that.lastName,_that.phone,_that.verificationId,_that.destinationMasked,_that.expiresIn,_that.password,_that.email,_that.acceptedTerms,_that.verificationToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String phone,  String verificationId,  String destinationMasked,  int expiresIn,  String password,  String email,  bool acceptedTerms,  String verificationToken)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationDraft() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.verificationId,_that.destinationMasked,_that.expiresIn,_that.password,_that.email,_that.acceptedTerms,_that.verificationToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistrationDraft implements RegistrationDraft {
  const _RegistrationDraft({this.firstName = '', this.lastName = '', this.phone = '', this.verificationId = '', this.destinationMasked = '', this.expiresIn = 0, this.password = '', this.email = '', this.acceptedTerms = false, this.verificationToken = ''});
  factory _RegistrationDraft.fromJson(Map<String, dynamic> json) => _$RegistrationDraftFromJson(json);

@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String verificationId;
@override@JsonKey() final  String destinationMasked;
@override@JsonKey() final  int expiresIn;
@override@JsonKey() final  String password;
@override@JsonKey() final  String email;
@override@JsonKey() final  bool acceptedTerms;
@override@JsonKey() final  String verificationToken;

/// Create a copy of RegistrationDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationDraftCopyWith<_RegistrationDraft> get copyWith => __$RegistrationDraftCopyWithImpl<_RegistrationDraft>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistrationDraftToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationDraft&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.destinationMasked, destinationMasked) || other.destinationMasked == destinationMasked)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.password, password) || other.password == password)&&(identical(other.email, email) || other.email == email)&&(identical(other.acceptedTerms, acceptedTerms) || other.acceptedTerms == acceptedTerms)&&(identical(other.verificationToken, verificationToken) || other.verificationToken == verificationToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,verificationId,destinationMasked,expiresIn,password,email,acceptedTerms,verificationToken);

@override
String toString() {
  return 'RegistrationDraft(firstName: $firstName, lastName: $lastName, phone: $phone, verificationId: $verificationId, destinationMasked: $destinationMasked, expiresIn: $expiresIn, password: $password, email: $email, acceptedTerms: $acceptedTerms, verificationToken: $verificationToken)';
}


}

/// @nodoc
abstract mixin class _$RegistrationDraftCopyWith<$Res> implements $RegistrationDraftCopyWith<$Res> {
  factory _$RegistrationDraftCopyWith(_RegistrationDraft value, $Res Function(_RegistrationDraft) _then) = __$RegistrationDraftCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String phone, String verificationId, String destinationMasked, int expiresIn, String password, String email, bool acceptedTerms, String verificationToken
});




}
/// @nodoc
class __$RegistrationDraftCopyWithImpl<$Res>
    implements _$RegistrationDraftCopyWith<$Res> {
  __$RegistrationDraftCopyWithImpl(this._self, this._then);

  final _RegistrationDraft _self;
  final $Res Function(_RegistrationDraft) _then;

/// Create a copy of RegistrationDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? phone = null,Object? verificationId = null,Object? destinationMasked = null,Object? expiresIn = null,Object? password = null,Object? email = null,Object? acceptedTerms = null,Object? verificationToken = null,}) {
  return _then(_RegistrationDraft(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,destinationMasked: null == destinationMasked ? _self.destinationMasked : destinationMasked // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,acceptedTerms: null == acceptedTerms ? _self.acceptedTerms : acceptedTerms // ignore: cast_nullable_to_non_nullable
as bool,verificationToken: null == verificationToken ? _self.verificationToken : verificationToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
