// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_pregnancy_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeklyPregnancyContentModel {

 int get week;@JsonKey(name: 'size_cm') double? get sizeCm;@JsonKey(name: 'weight_g') int? get weightG;@JsonKey(name: 'fruit_comparison') String? get fruitComparison; String? get description;@JsonKey(name: 'development_highlights') List<String>? get developmentHighlights;@JsonKey(name: 'mom_changes') String? get momChanges;
/// Create a copy of WeeklyPregnancyContentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyPregnancyContentModelCopyWith<WeeklyPregnancyContentModel> get copyWith => _$WeeklyPregnancyContentModelCopyWithImpl<WeeklyPregnancyContentModel>(this as WeeklyPregnancyContentModel, _$identity);

  /// Serializes this WeeklyPregnancyContentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyPregnancyContentModel&&(identical(other.week, week) || other.week == week)&&(identical(other.sizeCm, sizeCm) || other.sizeCm == sizeCm)&&(identical(other.weightG, weightG) || other.weightG == weightG)&&(identical(other.fruitComparison, fruitComparison) || other.fruitComparison == fruitComparison)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.developmentHighlights, developmentHighlights)&&(identical(other.momChanges, momChanges) || other.momChanges == momChanges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,sizeCm,weightG,fruitComparison,description,const DeepCollectionEquality().hash(developmentHighlights),momChanges);

@override
String toString() {
  return 'WeeklyPregnancyContentModel(week: $week, sizeCm: $sizeCm, weightG: $weightG, fruitComparison: $fruitComparison, description: $description, developmentHighlights: $developmentHighlights, momChanges: $momChanges)';
}


}

/// @nodoc
abstract mixin class $WeeklyPregnancyContentModelCopyWith<$Res>  {
  factory $WeeklyPregnancyContentModelCopyWith(WeeklyPregnancyContentModel value, $Res Function(WeeklyPregnancyContentModel) _then) = _$WeeklyPregnancyContentModelCopyWithImpl;
@useResult
$Res call({
 int week,@JsonKey(name: 'size_cm') double? sizeCm,@JsonKey(name: 'weight_g') int? weightG,@JsonKey(name: 'fruit_comparison') String? fruitComparison, String? description,@JsonKey(name: 'development_highlights') List<String>? developmentHighlights,@JsonKey(name: 'mom_changes') String? momChanges
});




}
/// @nodoc
class _$WeeklyPregnancyContentModelCopyWithImpl<$Res>
    implements $WeeklyPregnancyContentModelCopyWith<$Res> {
  _$WeeklyPregnancyContentModelCopyWithImpl(this._self, this._then);

  final WeeklyPregnancyContentModel _self;
  final $Res Function(WeeklyPregnancyContentModel) _then;

/// Create a copy of WeeklyPregnancyContentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? sizeCm = freezed,Object? weightG = freezed,Object? fruitComparison = freezed,Object? description = freezed,Object? developmentHighlights = freezed,Object? momChanges = freezed,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,sizeCm: freezed == sizeCm ? _self.sizeCm : sizeCm // ignore: cast_nullable_to_non_nullable
as double?,weightG: freezed == weightG ? _self.weightG : weightG // ignore: cast_nullable_to_non_nullable
as int?,fruitComparison: freezed == fruitComparison ? _self.fruitComparison : fruitComparison // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,developmentHighlights: freezed == developmentHighlights ? _self.developmentHighlights : developmentHighlights // ignore: cast_nullable_to_non_nullable
as List<String>?,momChanges: freezed == momChanges ? _self.momChanges : momChanges // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyPregnancyContentModel].
extension WeeklyPregnancyContentModelPatterns on WeeklyPregnancyContentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyPregnancyContentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyPregnancyContentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyPregnancyContentModel value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyPregnancyContentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyPregnancyContentModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyPregnancyContentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int week, @JsonKey(name: 'size_cm')  double? sizeCm, @JsonKey(name: 'weight_g')  int? weightG, @JsonKey(name: 'fruit_comparison')  String? fruitComparison,  String? description, @JsonKey(name: 'development_highlights')  List<String>? developmentHighlights, @JsonKey(name: 'mom_changes')  String? momChanges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyPregnancyContentModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int week, @JsonKey(name: 'size_cm')  double? sizeCm, @JsonKey(name: 'weight_g')  int? weightG, @JsonKey(name: 'fruit_comparison')  String? fruitComparison,  String? description, @JsonKey(name: 'development_highlights')  List<String>? developmentHighlights, @JsonKey(name: 'mom_changes')  String? momChanges)  $default,) {final _that = this;
switch (_that) {
case _WeeklyPregnancyContentModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int week, @JsonKey(name: 'size_cm')  double? sizeCm, @JsonKey(name: 'weight_g')  int? weightG, @JsonKey(name: 'fruit_comparison')  String? fruitComparison,  String? description, @JsonKey(name: 'development_highlights')  List<String>? developmentHighlights, @JsonKey(name: 'mom_changes')  String? momChanges)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyPregnancyContentModel() when $default != null:
return $default(_that.week,_that.sizeCm,_that.weightG,_that.fruitComparison,_that.description,_that.developmentHighlights,_that.momChanges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyPregnancyContentModel implements WeeklyPregnancyContentModel {
  const _WeeklyPregnancyContentModel({required this.week, @JsonKey(name: 'size_cm') this.sizeCm, @JsonKey(name: 'weight_g') this.weightG, @JsonKey(name: 'fruit_comparison') this.fruitComparison, required this.description, @JsonKey(name: 'development_highlights') final  List<String>? developmentHighlights, @JsonKey(name: 'mom_changes') this.momChanges}): _developmentHighlights = developmentHighlights;
  factory _WeeklyPregnancyContentModel.fromJson(Map<String, dynamic> json) => _$WeeklyPregnancyContentModelFromJson(json);

@override final  int week;
@override@JsonKey(name: 'size_cm') final  double? sizeCm;
@override@JsonKey(name: 'weight_g') final  int? weightG;
@override@JsonKey(name: 'fruit_comparison') final  String? fruitComparison;
@override final  String? description;
 final  List<String>? _developmentHighlights;
@override@JsonKey(name: 'development_highlights') List<String>? get developmentHighlights {
  final value = _developmentHighlights;
  if (value == null) return null;
  if (_developmentHighlights is EqualUnmodifiableListView) return _developmentHighlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'mom_changes') final  String? momChanges;

/// Create a copy of WeeklyPregnancyContentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyPregnancyContentModelCopyWith<_WeeklyPregnancyContentModel> get copyWith => __$WeeklyPregnancyContentModelCopyWithImpl<_WeeklyPregnancyContentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyPregnancyContentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyPregnancyContentModel&&(identical(other.week, week) || other.week == week)&&(identical(other.sizeCm, sizeCm) || other.sizeCm == sizeCm)&&(identical(other.weightG, weightG) || other.weightG == weightG)&&(identical(other.fruitComparison, fruitComparison) || other.fruitComparison == fruitComparison)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._developmentHighlights, _developmentHighlights)&&(identical(other.momChanges, momChanges) || other.momChanges == momChanges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,sizeCm,weightG,fruitComparison,description,const DeepCollectionEquality().hash(_developmentHighlights),momChanges);

@override
String toString() {
  return 'WeeklyPregnancyContentModel(week: $week, sizeCm: $sizeCm, weightG: $weightG, fruitComparison: $fruitComparison, description: $description, developmentHighlights: $developmentHighlights, momChanges: $momChanges)';
}


}

/// @nodoc
abstract mixin class _$WeeklyPregnancyContentModelCopyWith<$Res> implements $WeeklyPregnancyContentModelCopyWith<$Res> {
  factory _$WeeklyPregnancyContentModelCopyWith(_WeeklyPregnancyContentModel value, $Res Function(_WeeklyPregnancyContentModel) _then) = __$WeeklyPregnancyContentModelCopyWithImpl;
@override @useResult
$Res call({
 int week,@JsonKey(name: 'size_cm') double? sizeCm,@JsonKey(name: 'weight_g') int? weightG,@JsonKey(name: 'fruit_comparison') String? fruitComparison, String? description,@JsonKey(name: 'development_highlights') List<String>? developmentHighlights,@JsonKey(name: 'mom_changes') String? momChanges
});




}
/// @nodoc
class __$WeeklyPregnancyContentModelCopyWithImpl<$Res>
    implements _$WeeklyPregnancyContentModelCopyWith<$Res> {
  __$WeeklyPregnancyContentModelCopyWithImpl(this._self, this._then);

  final _WeeklyPregnancyContentModel _self;
  final $Res Function(_WeeklyPregnancyContentModel) _then;

/// Create a copy of WeeklyPregnancyContentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? sizeCm = freezed,Object? weightG = freezed,Object? fruitComparison = freezed,Object? description = freezed,Object? developmentHighlights = freezed,Object? momChanges = freezed,}) {
  return _then(_WeeklyPregnancyContentModel(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,sizeCm: freezed == sizeCm ? _self.sizeCm : sizeCm // ignore: cast_nullable_to_non_nullable
as double?,weightG: freezed == weightG ? _self.weightG : weightG // ignore: cast_nullable_to_non_nullable
as int?,fruitComparison: freezed == fruitComparison ? _self.fruitComparison : fruitComparison // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,developmentHighlights: freezed == developmentHighlights ? _self._developmentHighlights : developmentHighlights // ignore: cast_nullable_to_non_nullable
as List<String>?,momChanges: freezed == momChanges ? _self.momChanges : momChanges // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
