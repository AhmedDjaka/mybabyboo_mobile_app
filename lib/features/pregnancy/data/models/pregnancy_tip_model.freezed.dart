// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_tip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PregnancyTipModel {

 int get id; int? get week; String get category; String get title; String get summary; String get content;@JsonKey(name: 'is_featured') bool get isFeatured;
/// Create a copy of PregnancyTipModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyTipModelCopyWith<PregnancyTipModel> get copyWith => _$PregnancyTipModelCopyWithImpl<PregnancyTipModel>(this as PregnancyTipModel, _$identity);

  /// Serializes this PregnancyTipModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyTipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.week, week) || other.week == week)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,week,category,title,summary,content,isFeatured);

@override
String toString() {
  return 'PregnancyTipModel(id: $id, week: $week, category: $category, title: $title, summary: $summary, content: $content, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class $PregnancyTipModelCopyWith<$Res>  {
  factory $PregnancyTipModelCopyWith(PregnancyTipModel value, $Res Function(PregnancyTipModel) _then) = _$PregnancyTipModelCopyWithImpl;
@useResult
$Res call({
 int id, int? week, String category, String title, String summary, String content,@JsonKey(name: 'is_featured') bool isFeatured
});




}
/// @nodoc
class _$PregnancyTipModelCopyWithImpl<$Res>
    implements $PregnancyTipModelCopyWith<$Res> {
  _$PregnancyTipModelCopyWithImpl(this._self, this._then);

  final PregnancyTipModel _self;
  final $Res Function(PregnancyTipModel) _then;

/// Create a copy of PregnancyTipModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? week = freezed,Object? category = null,Object? title = null,Object? summary = null,Object? content = null,Object? isFeatured = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,week: freezed == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PregnancyTipModel].
extension PregnancyTipModelPatterns on PregnancyTipModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyTipModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyTipModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyTipModel value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyTipModel value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? week,  String category,  String title,  String summary,  String content, @JsonKey(name: 'is_featured')  bool isFeatured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyTipModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? week,  String category,  String title,  String summary,  String content, @JsonKey(name: 'is_featured')  bool isFeatured)  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? week,  String category,  String title,  String summary,  String content, @JsonKey(name: 'is_featured')  bool isFeatured)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipModel() when $default != null:
return $default(_that.id,_that.week,_that.category,_that.title,_that.summary,_that.content,_that.isFeatured);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PregnancyTipModel implements PregnancyTipModel {
  const _PregnancyTipModel({required this.id, this.week, required this.category, required this.title, required this.summary, required this.content, @JsonKey(name: 'is_featured') required this.isFeatured});
  factory _PregnancyTipModel.fromJson(Map<String, dynamic> json) => _$PregnancyTipModelFromJson(json);

@override final  int id;
@override final  int? week;
@override final  String category;
@override final  String title;
@override final  String summary;
@override final  String content;
@override@JsonKey(name: 'is_featured') final  bool isFeatured;

/// Create a copy of PregnancyTipModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyTipModelCopyWith<_PregnancyTipModel> get copyWith => __$PregnancyTipModelCopyWithImpl<_PregnancyTipModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PregnancyTipModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyTipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.week, week) || other.week == week)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,week,category,title,summary,content,isFeatured);

@override
String toString() {
  return 'PregnancyTipModel(id: $id, week: $week, category: $category, title: $title, summary: $summary, content: $content, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class _$PregnancyTipModelCopyWith<$Res> implements $PregnancyTipModelCopyWith<$Res> {
  factory _$PregnancyTipModelCopyWith(_PregnancyTipModel value, $Res Function(_PregnancyTipModel) _then) = __$PregnancyTipModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int? week, String category, String title, String summary, String content,@JsonKey(name: 'is_featured') bool isFeatured
});




}
/// @nodoc
class __$PregnancyTipModelCopyWithImpl<$Res>
    implements _$PregnancyTipModelCopyWith<$Res> {
  __$PregnancyTipModelCopyWithImpl(this._self, this._then);

  final _PregnancyTipModel _self;
  final $Res Function(_PregnancyTipModel) _then;

/// Create a copy of PregnancyTipModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? week = freezed,Object? category = null,Object? title = null,Object? summary = null,Object? content = null,Object? isFeatured = null,}) {
  return _then(_PregnancyTipModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,week: freezed == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
