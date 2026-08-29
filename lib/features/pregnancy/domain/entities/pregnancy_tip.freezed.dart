// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_tip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PregnancyTip {

 int get id; int? get week; PregnancyTipCategory get category; String get title; String get summary; String get content; bool get isFeatured;
/// Create a copy of PregnancyTip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyTipCopyWith<PregnancyTip> get copyWith => _$PregnancyTipCopyWithImpl<PregnancyTip>(this as PregnancyTip, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyTip&&(identical(other.id, id) || other.id == id)&&(identical(other.week, week) || other.week == week)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}


@override
int get hashCode => Object.hash(runtimeType,id,week,category,title,summary,content,isFeatured);

@override
String toString() {
  return 'PregnancyTip(id: $id, week: $week, category: $category, title: $title, summary: $summary, content: $content, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class $PregnancyTipCopyWith<$Res>  {
  factory $PregnancyTipCopyWith(PregnancyTip value, $Res Function(PregnancyTip) _then) = _$PregnancyTipCopyWithImpl;
@useResult
$Res call({
 int id, int? week, PregnancyTipCategory category, String title, String summary, String content, bool isFeatured
});




}
/// @nodoc
class _$PregnancyTipCopyWithImpl<$Res>
    implements $PregnancyTipCopyWith<$Res> {
  _$PregnancyTipCopyWithImpl(this._self, this._then);

  final PregnancyTip _self;
  final $Res Function(PregnancyTip) _then;

/// Create a copy of PregnancyTip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? week = freezed,Object? category = null,Object? title = null,Object? summary = null,Object? content = null,Object? isFeatured = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,week: freezed == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PregnancyTipCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PregnancyTip].
extension PregnancyTipPatterns on PregnancyTip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyTip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyTip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyTip value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyTip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyTip value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyTip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? week,  PregnancyTipCategory category,  String title,  String summary,  String content,  bool isFeatured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyTip() when $default != null:
return $default(_that.id,_that.week,_that.category,_that.title,_that.summary,_that.content,_that.isFeatured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? week,  PregnancyTipCategory category,  String title,  String summary,  String content,  bool isFeatured)  $default,) {final _that = this;
switch (_that) {
case _PregnancyTip():
return $default(_that.id,_that.week,_that.category,_that.title,_that.summary,_that.content,_that.isFeatured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? week,  PregnancyTipCategory category,  String title,  String summary,  String content,  bool isFeatured)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyTip() when $default != null:
return $default(_that.id,_that.week,_that.category,_that.title,_that.summary,_that.content,_that.isFeatured);case _:
  return null;

}
}

}

/// @nodoc


class _PregnancyTip implements PregnancyTip {
  const _PregnancyTip({required this.id, this.week, required this.category, required this.title, required this.summary, required this.content, required this.isFeatured});
  

@override final  int id;
@override final  int? week;
@override final  PregnancyTipCategory category;
@override final  String title;
@override final  String summary;
@override final  String content;
@override final  bool isFeatured;

/// Create a copy of PregnancyTip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyTipCopyWith<_PregnancyTip> get copyWith => __$PregnancyTipCopyWithImpl<_PregnancyTip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyTip&&(identical(other.id, id) || other.id == id)&&(identical(other.week, week) || other.week == week)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}


@override
int get hashCode => Object.hash(runtimeType,id,week,category,title,summary,content,isFeatured);

@override
String toString() {
  return 'PregnancyTip(id: $id, week: $week, category: $category, title: $title, summary: $summary, content: $content, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class _$PregnancyTipCopyWith<$Res> implements $PregnancyTipCopyWith<$Res> {
  factory _$PregnancyTipCopyWith(_PregnancyTip value, $Res Function(_PregnancyTip) _then) = __$PregnancyTipCopyWithImpl;
@override @useResult
$Res call({
 int id, int? week, PregnancyTipCategory category, String title, String summary, String content, bool isFeatured
});




}
/// @nodoc
class __$PregnancyTipCopyWithImpl<$Res>
    implements _$PregnancyTipCopyWith<$Res> {
  __$PregnancyTipCopyWithImpl(this._self, this._then);

  final _PregnancyTip _self;
  final $Res Function(_PregnancyTip) _then;

/// Create a copy of PregnancyTip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? week = freezed,Object? category = null,Object? title = null,Object? summary = null,Object? content = null,Object? isFeatured = null,}) {
  return _then(_PregnancyTip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,week: freezed == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PregnancyTipCategory,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
