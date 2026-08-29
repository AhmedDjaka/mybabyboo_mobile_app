// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PregnancyDashboardState {

 bool get isLoading; bool get isWeekLoading; Pregnancy? get currentPregnancy; int? get currentWeek; int? get selectedWeek; WeeklyPregnancyContent? get weeklyContent; String? get errorMessage; String? get weeklyError;
/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyDashboardStateCopyWith<PregnancyDashboardState> get copyWith => _$PregnancyDashboardStateCopyWithImpl<PregnancyDashboardState>(this as PregnancyDashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyDashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isWeekLoading, isWeekLoading) || other.isWeekLoading == isWeekLoading)&&(identical(other.currentPregnancy, currentPregnancy) || other.currentPregnancy == currentPregnancy)&&(identical(other.currentWeek, currentWeek) || other.currentWeek == currentWeek)&&(identical(other.selectedWeek, selectedWeek) || other.selectedWeek == selectedWeek)&&(identical(other.weeklyContent, weeklyContent) || other.weeklyContent == weeklyContent)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.weeklyError, weeklyError) || other.weeklyError == weeklyError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isWeekLoading,currentPregnancy,currentWeek,selectedWeek,weeklyContent,errorMessage,weeklyError);

@override
String toString() {
  return 'PregnancyDashboardState(isLoading: $isLoading, isWeekLoading: $isWeekLoading, currentPregnancy: $currentPregnancy, currentWeek: $currentWeek, selectedWeek: $selectedWeek, weeklyContent: $weeklyContent, errorMessage: $errorMessage, weeklyError: $weeklyError)';
}


}

/// @nodoc
abstract mixin class $PregnancyDashboardStateCopyWith<$Res>  {
  factory $PregnancyDashboardStateCopyWith(PregnancyDashboardState value, $Res Function(PregnancyDashboardState) _then) = _$PregnancyDashboardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isWeekLoading, Pregnancy? currentPregnancy, int? currentWeek, int? selectedWeek, WeeklyPregnancyContent? weeklyContent, String? errorMessage, String? weeklyError
});


$PregnancyCopyWith<$Res>? get currentPregnancy;$WeeklyPregnancyContentCopyWith<$Res>? get weeklyContent;

}
/// @nodoc
class _$PregnancyDashboardStateCopyWithImpl<$Res>
    implements $PregnancyDashboardStateCopyWith<$Res> {
  _$PregnancyDashboardStateCopyWithImpl(this._self, this._then);

  final PregnancyDashboardState _self;
  final $Res Function(PregnancyDashboardState) _then;

/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isWeekLoading = null,Object? currentPregnancy = freezed,Object? currentWeek = freezed,Object? selectedWeek = freezed,Object? weeklyContent = freezed,Object? errorMessage = freezed,Object? weeklyError = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isWeekLoading: null == isWeekLoading ? _self.isWeekLoading : isWeekLoading // ignore: cast_nullable_to_non_nullable
as bool,currentPregnancy: freezed == currentPregnancy ? _self.currentPregnancy : currentPregnancy // ignore: cast_nullable_to_non_nullable
as Pregnancy?,currentWeek: freezed == currentWeek ? _self.currentWeek : currentWeek // ignore: cast_nullable_to_non_nullable
as int?,selectedWeek: freezed == selectedWeek ? _self.selectedWeek : selectedWeek // ignore: cast_nullable_to_non_nullable
as int?,weeklyContent: freezed == weeklyContent ? _self.weeklyContent : weeklyContent // ignore: cast_nullable_to_non_nullable
as WeeklyPregnancyContent?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,weeklyError: freezed == weeklyError ? _self.weeklyError : weeklyError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PregnancyCopyWith<$Res>? get currentPregnancy {
    if (_self.currentPregnancy == null) {
    return null;
  }

  return $PregnancyCopyWith<$Res>(_self.currentPregnancy!, (value) {
    return _then(_self.copyWith(currentPregnancy: value));
  });
}/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyPregnancyContentCopyWith<$Res>? get weeklyContent {
    if (_self.weeklyContent == null) {
    return null;
  }

  return $WeeklyPregnancyContentCopyWith<$Res>(_self.weeklyContent!, (value) {
    return _then(_self.copyWith(weeklyContent: value));
  });
}
}


/// Adds pattern-matching-related methods to [PregnancyDashboardState].
extension PregnancyDashboardStatePatterns on PregnancyDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyDashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyDashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyDashboardState value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyDashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyDashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyDashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isWeekLoading,  Pregnancy? currentPregnancy,  int? currentWeek,  int? selectedWeek,  WeeklyPregnancyContent? weeklyContent,  String? errorMessage,  String? weeklyError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyDashboardState() when $default != null:
return $default(_that.isLoading,_that.isWeekLoading,_that.currentPregnancy,_that.currentWeek,_that.selectedWeek,_that.weeklyContent,_that.errorMessage,_that.weeklyError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isWeekLoading,  Pregnancy? currentPregnancy,  int? currentWeek,  int? selectedWeek,  WeeklyPregnancyContent? weeklyContent,  String? errorMessage,  String? weeklyError)  $default,) {final _that = this;
switch (_that) {
case _PregnancyDashboardState():
return $default(_that.isLoading,_that.isWeekLoading,_that.currentPregnancy,_that.currentWeek,_that.selectedWeek,_that.weeklyContent,_that.errorMessage,_that.weeklyError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isWeekLoading,  Pregnancy? currentPregnancy,  int? currentWeek,  int? selectedWeek,  WeeklyPregnancyContent? weeklyContent,  String? errorMessage,  String? weeklyError)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyDashboardState() when $default != null:
return $default(_that.isLoading,_that.isWeekLoading,_that.currentPregnancy,_that.currentWeek,_that.selectedWeek,_that.weeklyContent,_that.errorMessage,_that.weeklyError);case _:
  return null;

}
}

}

/// @nodoc


class _PregnancyDashboardState implements PregnancyDashboardState {
  const _PregnancyDashboardState({this.isLoading = false, this.isWeekLoading = false, this.currentPregnancy, this.currentWeek, this.selectedWeek, this.weeklyContent, this.errorMessage, this.weeklyError});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isWeekLoading;
@override final  Pregnancy? currentPregnancy;
@override final  int? currentWeek;
@override final  int? selectedWeek;
@override final  WeeklyPregnancyContent? weeklyContent;
@override final  String? errorMessage;
@override final  String? weeklyError;

/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyDashboardStateCopyWith<_PregnancyDashboardState> get copyWith => __$PregnancyDashboardStateCopyWithImpl<_PregnancyDashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyDashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isWeekLoading, isWeekLoading) || other.isWeekLoading == isWeekLoading)&&(identical(other.currentPregnancy, currentPregnancy) || other.currentPregnancy == currentPregnancy)&&(identical(other.currentWeek, currentWeek) || other.currentWeek == currentWeek)&&(identical(other.selectedWeek, selectedWeek) || other.selectedWeek == selectedWeek)&&(identical(other.weeklyContent, weeklyContent) || other.weeklyContent == weeklyContent)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.weeklyError, weeklyError) || other.weeklyError == weeklyError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isWeekLoading,currentPregnancy,currentWeek,selectedWeek,weeklyContent,errorMessage,weeklyError);

@override
String toString() {
  return 'PregnancyDashboardState(isLoading: $isLoading, isWeekLoading: $isWeekLoading, currentPregnancy: $currentPregnancy, currentWeek: $currentWeek, selectedWeek: $selectedWeek, weeklyContent: $weeklyContent, errorMessage: $errorMessage, weeklyError: $weeklyError)';
}


}

/// @nodoc
abstract mixin class _$PregnancyDashboardStateCopyWith<$Res> implements $PregnancyDashboardStateCopyWith<$Res> {
  factory _$PregnancyDashboardStateCopyWith(_PregnancyDashboardState value, $Res Function(_PregnancyDashboardState) _then) = __$PregnancyDashboardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isWeekLoading, Pregnancy? currentPregnancy, int? currentWeek, int? selectedWeek, WeeklyPregnancyContent? weeklyContent, String? errorMessage, String? weeklyError
});


@override $PregnancyCopyWith<$Res>? get currentPregnancy;@override $WeeklyPregnancyContentCopyWith<$Res>? get weeklyContent;

}
/// @nodoc
class __$PregnancyDashboardStateCopyWithImpl<$Res>
    implements _$PregnancyDashboardStateCopyWith<$Res> {
  __$PregnancyDashboardStateCopyWithImpl(this._self, this._then);

  final _PregnancyDashboardState _self;
  final $Res Function(_PregnancyDashboardState) _then;

/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isWeekLoading = null,Object? currentPregnancy = freezed,Object? currentWeek = freezed,Object? selectedWeek = freezed,Object? weeklyContent = freezed,Object? errorMessage = freezed,Object? weeklyError = freezed,}) {
  return _then(_PregnancyDashboardState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isWeekLoading: null == isWeekLoading ? _self.isWeekLoading : isWeekLoading // ignore: cast_nullable_to_non_nullable
as bool,currentPregnancy: freezed == currentPregnancy ? _self.currentPregnancy : currentPregnancy // ignore: cast_nullable_to_non_nullable
as Pregnancy?,currentWeek: freezed == currentWeek ? _self.currentWeek : currentWeek // ignore: cast_nullable_to_non_nullable
as int?,selectedWeek: freezed == selectedWeek ? _self.selectedWeek : selectedWeek // ignore: cast_nullable_to_non_nullable
as int?,weeklyContent: freezed == weeklyContent ? _self.weeklyContent : weeklyContent // ignore: cast_nullable_to_non_nullable
as WeeklyPregnancyContent?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,weeklyError: freezed == weeklyError ? _self.weeklyError : weeklyError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PregnancyCopyWith<$Res>? get currentPregnancy {
    if (_self.currentPregnancy == null) {
    return null;
  }

  return $PregnancyCopyWith<$Res>(_self.currentPregnancy!, (value) {
    return _then(_self.copyWith(currentPregnancy: value));
  });
}/// Create a copy of PregnancyDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyPregnancyContentCopyWith<$Res>? get weeklyContent {
    if (_self.weeklyContent == null) {
    return null;
  }

  return $WeeklyPregnancyContentCopyWith<$Res>(_self.weeklyContent!, (value) {
    return _then(_self.copyWith(weeklyContent: value));
  });
}
}

// dart format on
