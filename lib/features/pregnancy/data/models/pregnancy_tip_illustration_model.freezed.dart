// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_tip_illustration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PregnancyTipIllustrationModel {

 String get key;@JsonKey(name: 'thumbnail_url') String? get thumbnailUrl;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'alt_text') String? get altText;
/// Create a copy of PregnancyTipIllustrationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyTipIllustrationModelCopyWith<PregnancyTipIllustrationModel> get copyWith => _$PregnancyTipIllustrationModelCopyWithImpl<PregnancyTipIllustrationModel>(this as PregnancyTipIllustrationModel, _$identity);

  /// Serializes this PregnancyTipIllustrationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyTipIllustrationModel&&(identical(other.key, key) || other.key == key)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.altText, altText) || other.altText == altText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,thumbnailUrl,imageUrl,altText);

@override
String toString() {
  return 'PregnancyTipIllustrationModel(key: $key, thumbnailUrl: $thumbnailUrl, imageUrl: $imageUrl, altText: $altText)';
}


}

/// @nodoc
abstract mixin class $PregnancyTipIllustrationModelCopyWith<$Res>  {
  factory $PregnancyTipIllustrationModelCopyWith(PregnancyTipIllustrationModel value, $Res Function(PregnancyTipIllustrationModel) _then) = _$PregnancyTipIllustrationModelCopyWithImpl;
@useResult
$Res call({
 String key,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'alt_text') String? altText
});




}
/// @nodoc
class _$PregnancyTipIllustrationModelCopyWithImpl<$Res>
    implements $PregnancyTipIllustrationModelCopyWith<$Res> {
  _$PregnancyTipIllustrationModelCopyWithImpl(this._self, this._then);

  final PregnancyTipIllustrationModel _self;
  final $Res Function(PregnancyTipIllustrationModel) _then;

/// Create a copy of PregnancyTipIllustrationModel
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


/// Adds pattern-matching-related methods to [PregnancyTipIllustrationModel].
extension PregnancyTipIllustrationModelPatterns on PregnancyTipIllustrationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyTipIllustrationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyTipIllustrationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyTipIllustrationModel value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipIllustrationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyTipIllustrationModel value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipIllustrationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'alt_text')  String? altText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyTipIllustrationModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'alt_text')  String? altText)  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipIllustrationModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'alt_text')  String? altText)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipIllustrationModel() when $default != null:
return $default(_that.key,_that.thumbnailUrl,_that.imageUrl,_that.altText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PregnancyTipIllustrationModel implements PregnancyTipIllustrationModel {
  const _PregnancyTipIllustrationModel({required this.key, @JsonKey(name: 'thumbnail_url') this.thumbnailUrl, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'alt_text') this.altText});
  factory _PregnancyTipIllustrationModel.fromJson(Map<String, dynamic> json) => _$PregnancyTipIllustrationModelFromJson(json);

@override final  String key;
@override@JsonKey(name: 'thumbnail_url') final  String? thumbnailUrl;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'alt_text') final  String? altText;

/// Create a copy of PregnancyTipIllustrationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyTipIllustrationModelCopyWith<_PregnancyTipIllustrationModel> get copyWith => __$PregnancyTipIllustrationModelCopyWithImpl<_PregnancyTipIllustrationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PregnancyTipIllustrationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyTipIllustrationModel&&(identical(other.key, key) || other.key == key)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.altText, altText) || other.altText == altText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,thumbnailUrl,imageUrl,altText);

@override
String toString() {
  return 'PregnancyTipIllustrationModel(key: $key, thumbnailUrl: $thumbnailUrl, imageUrl: $imageUrl, altText: $altText)';
}


}

/// @nodoc
abstract mixin class _$PregnancyTipIllustrationModelCopyWith<$Res> implements $PregnancyTipIllustrationModelCopyWith<$Res> {
  factory _$PregnancyTipIllustrationModelCopyWith(_PregnancyTipIllustrationModel value, $Res Function(_PregnancyTipIllustrationModel) _then) = __$PregnancyTipIllustrationModelCopyWithImpl;
@override @useResult
$Res call({
 String key,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'alt_text') String? altText
});




}
/// @nodoc
class __$PregnancyTipIllustrationModelCopyWithImpl<$Res>
    implements _$PregnancyTipIllustrationModelCopyWith<$Res> {
  __$PregnancyTipIllustrationModelCopyWithImpl(this._self, this._then);

  final _PregnancyTipIllustrationModel _self;
  final $Res Function(_PregnancyTipIllustrationModel) _then;

/// Create a copy of PregnancyTipIllustrationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? thumbnailUrl = freezed,Object? imageUrl = freezed,Object? altText = freezed,}) {
  return _then(_PregnancyTipIllustrationModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,altText: freezed == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
