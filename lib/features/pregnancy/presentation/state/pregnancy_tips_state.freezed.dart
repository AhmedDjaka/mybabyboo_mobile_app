// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_tips_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PregnancyTipsState {

 bool get isLoading; String? get error; List<PregnancyTip> get tips; PregnancyTipCategory? get selectedCategory; int? get currentWeekContext;
/// Create a copy of PregnancyTipsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyTipsStateCopyWith<PregnancyTipsState> get copyWith => _$PregnancyTipsStateCopyWithImpl<PregnancyTipsState>(this as PregnancyTipsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyTipsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.tips, tips)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentWeekContext, currentWeekContext) || other.currentWeekContext == currentWeekContext));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,const DeepCollectionEquality().hash(tips),selectedCategory,currentWeekContext);

@override
String toString() {
  return 'PregnancyTipsState(isLoading: $isLoading, error: $error, tips: $tips, selectedCategory: $selectedCategory, currentWeekContext: $currentWeekContext)';
}


}

/// @nodoc
abstract mixin class $PregnancyTipsStateCopyWith<$Res>  {
  factory $PregnancyTipsStateCopyWith(PregnancyTipsState value, $Res Function(PregnancyTipsState) _then) = _$PregnancyTipsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, List<PregnancyTip> tips, PregnancyTipCategory? selectedCategory, int? currentWeekContext
});




}
/// @nodoc
class _$PregnancyTipsStateCopyWithImpl<$Res>
    implements $PregnancyTipsStateCopyWith<$Res> {
  _$PregnancyTipsStateCopyWithImpl(this._self, this._then);

  final PregnancyTipsState _self;
  final $Res Function(PregnancyTipsState) _then;

/// Create a copy of PregnancyTipsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? tips = null,Object? selectedCategory = freezed,Object? currentWeekContext = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,tips: null == tips ? _self.tips : tips // ignore: cast_nullable_to_non_nullable
as List<PregnancyTip>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as PregnancyTipCategory?,currentWeekContext: freezed == currentWeekContext ? _self.currentWeekContext : currentWeekContext // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PregnancyTipsState].
extension PregnancyTipsStatePatterns on PregnancyTipsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyTipsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyTipsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyTipsState value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyTipsState value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyTipsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  List<PregnancyTip> tips,  PregnancyTipCategory? selectedCategory,  int? currentWeekContext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyTipsState() when $default != null:
return $default(_that.isLoading,_that.error,_that.tips,_that.selectedCategory,_that.currentWeekContext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  List<PregnancyTip> tips,  PregnancyTipCategory? selectedCategory,  int? currentWeekContext)  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipsState():
return $default(_that.isLoading,_that.error,_that.tips,_that.selectedCategory,_that.currentWeekContext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  List<PregnancyTip> tips,  PregnancyTipCategory? selectedCategory,  int? currentWeekContext)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyTipsState() when $default != null:
return $default(_that.isLoading,_that.error,_that.tips,_that.selectedCategory,_that.currentWeekContext);case _:
  return null;

}
}

}

/// @nodoc


class _PregnancyTipsState implements PregnancyTipsState {
  const _PregnancyTipsState({this.isLoading = true, this.error = null, final  List<PregnancyTip> tips = const [], this.selectedCategory, this.currentWeekContext}): _tips = tips;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String? error;
 final  List<PregnancyTip> _tips;
@override@JsonKey() List<PregnancyTip> get tips {
  if (_tips is EqualUnmodifiableListView) return _tips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tips);
}

@override final  PregnancyTipCategory? selectedCategory;
@override final  int? currentWeekContext;

/// Create a copy of PregnancyTipsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyTipsStateCopyWith<_PregnancyTipsState> get copyWith => __$PregnancyTipsStateCopyWithImpl<_PregnancyTipsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyTipsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._tips, _tips)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.currentWeekContext, currentWeekContext) || other.currentWeekContext == currentWeekContext));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,const DeepCollectionEquality().hash(_tips),selectedCategory,currentWeekContext);

@override
String toString() {
  return 'PregnancyTipsState(isLoading: $isLoading, error: $error, tips: $tips, selectedCategory: $selectedCategory, currentWeekContext: $currentWeekContext)';
}


}

/// @nodoc
abstract mixin class _$PregnancyTipsStateCopyWith<$Res> implements $PregnancyTipsStateCopyWith<$Res> {
  factory _$PregnancyTipsStateCopyWith(_PregnancyTipsState value, $Res Function(_PregnancyTipsState) _then) = __$PregnancyTipsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, List<PregnancyTip> tips, PregnancyTipCategory? selectedCategory, int? currentWeekContext
});




}
/// @nodoc
class __$PregnancyTipsStateCopyWithImpl<$Res>
    implements _$PregnancyTipsStateCopyWith<$Res> {
  __$PregnancyTipsStateCopyWithImpl(this._self, this._then);

  final _PregnancyTipsState _self;
  final $Res Function(_PregnancyTipsState) _then;

/// Create a copy of PregnancyTipsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? tips = null,Object? selectedCategory = freezed,Object? currentWeekContext = freezed,}) {
  return _then(_PregnancyTipsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,tips: null == tips ? _self._tips : tips // ignore: cast_nullable_to_non_nullable
as List<PregnancyTip>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as PregnancyTipCategory?,currentWeekContext: freezed == currentWeekContext ? _self.currentWeekContext : currentWeekContext // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
