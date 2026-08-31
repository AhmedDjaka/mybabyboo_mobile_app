// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_tip_illustration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PregnancyTipIllustration {

 String get key; String? get thumbnailUrl; String? get imageUrl; String? get altText;
/// Create a copy of PregnancyTipIllustration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyTipIllustrationCopyWith<PregnancyTipIllustration> get copyWith => _$PregnancyTipIllustrationCopyWithImpl<PregnancyTipIllustration>(this as PregnancyTipIllustration, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyTipIllustration&&(identical(other.key, key) || other.key == key)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.altText, altText) || other.altText == altText));
}


@override
int get hashCode => Object.hash(runtimeType,key,thumbnailUrl,imageUrl,altText);

@override
String toString() {
  return 'PregnancyTipIllustration(key: $key, thumbnailUrl: $thumbnailUrl, imageUrl: $imageUrl, altText: $altText)';
}


}

/// @nodoc
abstract mixin class $PregnancyTipIllustrationCopyWith<$Res>  {
  factory $PregnancyTipIllustrationCopyWith(PregnancyTipIllustration value, $Res Function(PregnancyTipIllustration) _then) = _$PregnancyTipIllustrationCopyWithImpl;
@useResult
$Res call({
 String key, String? thumbnailUrl, String? imageUrl, String? altText
});




}
/// @nodoc
class _$PregnancyTipIllustrationCopyWithImpl<$Res>
    implements $PregnancyTipIllustrationCopyWith<$Res> {
  _$PregnancyTipIllustrationCopyWithImpl(this._self, this._then);

  final PregnancyTipIllustration _self;
  final $Res Function(PregnancyTipIllustration) _then;

/// Create a copy of PregnancyTipIllustration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? thumbnailUrl = freezed,Object? imageUrl = freezed,Object? altText = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,altText: freezed == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PregnancyTipIllustration].
extension PregnancyTipIllustrationPatterns on PregnancyTipIllustration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyTipIllustration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyTipIllustration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyTipIllustration value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipIllustration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyTipIllustration value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipIllustration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String? thumbnailUrl,  String? imageUrl,  String? altText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyTipIllustration() when $default != null:
return $default(_that.key,_that.thumbnailUrl,_that.imageUrl,_that.altText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String? thumbnailUrl,  String? imageUrl,  String? altText)  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipIllustration():
return $default(_that.key,_that.thumbnailUrl,_that.imageUrl,_that.altText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String? thumbnailUrl,  String? imageUrl,  String? altText)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipIllustration() when $default != null:
return $default(_that.key,_that.thumbnailUrl,_that.imageUrl,_that.altText);case _:
  return null;

}
}

}

/// @nodoc


class _PregnancyTipIllustration implements PregnancyTipIllustration {
  const _PregnancyTipIllustration({required this.key, this.thumbnailUrl, this.imageUrl, this.altText});
  

@override final  String key;
@override final  String? thumbnailUrl;
@override final  String? imageUrl;
@override final  String? altText;

/// Create a copy of PregnancyTipIllustration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyTipIllustrationCopyWith<_PregnancyTipIllustration> get copyWith => __$PregnancyTipIllustrationCopyWithImpl<_PregnancyTipIllustration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyTipIllustration&&(identical(other.key, key) || other.key == key)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.altText, altText) || other.altText == altText));
}


@override
int get hashCode => Object.hash(runtimeType,key,thumbnailUrl,imageUrl,altText);

@override
String toString() {
  return 'PregnancyTipIllustration(key: $key, thumbnailUrl: $thumbnailUrl, imageUrl: $imageUrl, altText: $altText)';
}


}

/// @nodoc
abstract mixin class _$PregnancyTipIllustrationCopyWith<$Res> implements $PregnancyTipIllustrationCopyWith<$Res> {
  factory _$PregnancyTipIllustrationCopyWith(_PregnancyTipIllustration value, $Res Function(_PregnancyTipIllustration) _then) = __$PregnancyTipIllustrationCopyWithImpl;
@override @useResult
$Res call({
 String key, String? thumbnailUrl, String? imageUrl, String? altText
});




}
/// @nodoc
class __$PregnancyTipIllustrationCopyWithImpl<$Res>
    implements _$PregnancyTipIllustrationCopyWith<$Res> {
  __$PregnancyTipIllustrationCopyWithImpl(this._self, this._then);

  final _PregnancyTipIllustration _self;
  final $Res Function(_PregnancyTipIllustration) _then;

/// Create a copy of PregnancyTipIllustration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? thumbnailUrl = freezed,Object? imageUrl = freezed,Object? altText = freezed,}) {
  return _then(_PregnancyTipIllustration(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,altText: freezed == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
