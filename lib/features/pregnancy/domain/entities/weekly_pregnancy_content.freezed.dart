// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_pregnancy_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeeklyPregnancyContent {

 int get week; double? get sizeCm; int? get weightG; String? get fruitComparison; String? get description; List<String> get developmentHighlights; String? get momChanges;
/// Create a copy of WeeklyPregnancyContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyPregnancyContentCopyWith<WeeklyPregnancyContent> get copyWith => _$WeeklyPregnancyContentCopyWithImpl<WeeklyPregnancyContent>(this as WeeklyPregnancyContent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyPregnancyContent&&(identical(other.week, week) || other.week == week)&&(identical(other.sizeCm, sizeCm) || other.sizeCm == sizeCm)&&(identical(other.weightG, weightG) || other.weightG == weightG)&&(identical(other.fruitComparison, fruitComparison) || other.fruitComparison == fruitComparison)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.developmentHighlights, developmentHighlights)&&(identical(other.momChanges, momChanges) || other.momChanges == momChanges));
}


@override
int get hashCode => Object.hash(runtimeType,week,sizeCm,weightG,fruitComparison,description,const DeepCollectionEquality().hash(developmentHighlights),momChanges);

@override
String toString() {
  return 'WeeklyPregnancyContent(week: $week, sizeCm: $sizeCm, weightG: $weightG, fruitComparison: $fruitComparison, description: $description, developmentHighlights: $developmentHighlights, momChanges: $momChanges)';
}


}

/// @nodoc
abstract mixin class $WeeklyPregnancyContentCopyWith<$Res>  {
  factory $WeeklyPregnancyContentCopyWith(WeeklyPregnancyContent value, $Res Function(WeeklyPregnancyContent) _then) = _$WeeklyPregnancyContentCopyWithImpl;
@useResult
$Res call({
 int week, double? sizeCm, int? weightG, String? fruitComparison, String? description, List<String> developmentHighlights, String? momChanges
});




}
/// @nodoc
class _$WeeklyPregnancyContentCopyWithImpl<$Res>
    implements $WeeklyPregnancyContentCopyWith<$Res> {
  _$WeeklyPregnancyContentCopyWithImpl(this._self, this._then);

  final WeeklyPregnancyContent _self;
  final $Res Function(WeeklyPregnancyContent) _then;

/// Create a copy of WeeklyPregnancyContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? sizeCm = freezed,Object? weightG = freezed,Object? fruitComparison = freezed,Object? description = freezed,Object? developmentHighlights = null,Object? momChanges = freezed,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,sizeCm: freezed == sizeCm ? _self.sizeCm : sizeCm // ignore: cast_nullable_to_non_nullable
as double?,weightG: freezed == weightG ? _self.weightG : weightG // ignore: cast_nullable_to_non_nullable
as int?,fruitComparison: freezed == fruitComparison ? _self.fruitComparison : fruitComparison // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,developmentHighlights: null == developmentHighlights ? _self.developmentHighlights : developmentHighlights // ignore: cast_nullable_to_non_nullable
as List<String>,momChanges: freezed == momChanges ? _self.momChanges : momChanges // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyPregnancyContent].
extension WeeklyPregnancyContentPatterns on WeeklyPregnancyContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyPregnancyContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyPregnancyContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyPregnancyContent value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyPregnancyContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyPregnancyContent value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyPregnancyContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int week,  double? sizeCm,  int? weightG,  String? fruitComparison,  String? description,  List<String> developmentHighlights,  String? momChanges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyPregnancyContent() when $default != null:
return $default(_that.week,_that.sizeCm,_that.weightG,_that.fruitComparison,_that.description,_that.developmentHighlights,_that.momChanges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int week,  double? sizeCm,  int? weightG,  String? fruitComparison,  String? description,  List<String> developmentHighlights,  String? momChanges)  $default,) {final _that = this;
switch (_that) {
case _WeeklyPregnancyContent():
return $default(_that.week,_that.sizeCm,_that.weightG,_that.fruitComparison,_that.description,_that.developmentHighlights,_that.momChanges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int week,  double? sizeCm,  int? weightG,  String? fruitComparison,  String? description,  List<String> developmentHighlights,  String? momChanges)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyPregnancyContent() when $default != null:
return $default(_that.week,_that.sizeCm,_that.weightG,_that.fruitComparison,_that.description,_that.developmentHighlights,_that.momChanges);case _:
  return null;

}
}

}

/// @nodoc


class _WeeklyPregnancyContent implements WeeklyPregnancyContent {
  const _WeeklyPregnancyContent({required this.week, this.sizeCm, this.weightG, this.fruitComparison, this.description, final  List<String> developmentHighlights = const [], this.momChanges}): _developmentHighlights = developmentHighlights;
  

@override final  int week;
@override final  double? sizeCm;
@override final  int? weightG;
@override final  String? fruitComparison;
@override final  String? description;
 final  List<String> _developmentHighlights;
@override@JsonKey() List<String> get developmentHighlights {
  if (_developmentHighlights is EqualUnmodifiableListView) return _developmentHighlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_developmentHighlights);
}

@override final  String? momChanges;

/// Create a copy of WeeklyPregnancyContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyPregnancyContentCopyWith<_WeeklyPregnancyContent> get copyWith => __$WeeklyPregnancyContentCopyWithImpl<_WeeklyPregnancyContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyPregnancyContent&&(identical(other.week, week) || other.week == week)&&(identical(other.sizeCm, sizeCm) || other.sizeCm == sizeCm)&&(identical(other.weightG, weightG) || other.weightG == weightG)&&(identical(other.fruitComparison, fruitComparison) || other.fruitComparison == fruitComparison)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._developmentHighlights, _developmentHighlights)&&(identical(other.momChanges, momChanges) || other.momChanges == momChanges));
}


@override
int get hashCode => Object.hash(runtimeType,week,sizeCm,weightG,fruitComparison,description,const DeepCollectionEquality().hash(_developmentHighlights),momChanges);

@override
String toString() {
  return 'WeeklyPregnancyContent(week: $week, sizeCm: $sizeCm, weightG: $weightG, fruitComparison: $fruitComparison, description: $description, developmentHighlights: $developmentHighlights, momChanges: $momChanges)';
}


}

/// @nodoc
abstract mixin class _$WeeklyPregnancyContentCopyWith<$Res> implements $WeeklyPregnancyContentCopyWith<$Res> {
  factory _$WeeklyPregnancyContentCopyWith(_WeeklyPregnancyContent value, $Res Function(_WeeklyPregnancyContent) _then) = __$WeeklyPregnancyContentCopyWithImpl;
@override @useResult
$Res call({
 int week, double? sizeCm, int? weightG, String? fruitComparison, String? description, List<String> developmentHighlights, String? momChanges
});




}
/// @nodoc
class __$WeeklyPregnancyContentCopyWithImpl<$Res>
    implements _$WeeklyPregnancyContentCopyWith<$Res> {
  __$WeeklyPregnancyContentCopyWithImpl(this._self, this._then);

  final _WeeklyPregnancyContent _self;
  final $Res Function(_WeeklyPregnancyContent) _then;

/// Create a copy of WeeklyPregnancyContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? sizeCm = freezed,Object? weightG = freezed,Object? fruitComparison = freezed,Object? description = freezed,Object? developmentHighlights = null,Object? momChanges = freezed,}) {
  return _then(_WeeklyPregnancyContent(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,sizeCm: freezed == sizeCm ? _self.sizeCm : sizeCm // ignore: cast_nullable_to_non_nullable
as double?,weightG: freezed == weightG ? _self.weightG : weightG // ignore: cast_nullable_to_non_nullable
as int?,fruitComparison: freezed == fruitComparison ? _self.fruitComparison : fruitComparison // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,developmentHighlights: null == developmentHighlights ? _self._developmentHighlights : developmentHighlights // ignore: cast_nullable_to_non_nullable
as List<String>,momChanges: freezed == momChanges ? _self.momChanges : momChanges // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
