// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PregnancySetupState {

 int get currentStep; PregnancyDatingMethod? get selectedMethod; DateTime? get lmpDate; DateTime? get professionalDueDate; bool get isLoading; String? get error;
/// Create a copy of PregnancySetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancySetupStateCopyWith<PregnancySetupState> get copyWith => _$PregnancySetupStateCopyWithImpl<PregnancySetupState>(this as PregnancySetupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancySetupState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.selectedMethod, selectedMethod) || other.selectedMethod == selectedMethod)&&(identical(other.lmpDate, lmpDate) || other.lmpDate == lmpDate)&&(identical(other.professionalDueDate, professionalDueDate) || other.professionalDueDate == professionalDueDate)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,selectedMethod,lmpDate,professionalDueDate,isLoading,error);

@override
String toString() {
  return 'PregnancySetupState(currentStep: $currentStep, selectedMethod: $selectedMethod, lmpDate: $lmpDate, professionalDueDate: $professionalDueDate, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PregnancySetupStateCopyWith<$Res>  {
  factory $PregnancySetupStateCopyWith(PregnancySetupState value, $Res Function(PregnancySetupState) _then) = _$PregnancySetupStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, PregnancyDatingMethod? selectedMethod, DateTime? lmpDate, DateTime? professionalDueDate, bool isLoading, String? error
});




}
/// @nodoc
class _$PregnancySetupStateCopyWithImpl<$Res>
    implements $PregnancySetupStateCopyWith<$Res> {
  _$PregnancySetupStateCopyWithImpl(this._self, this._then);

  final PregnancySetupState _self;
  final $Res Function(PregnancySetupState) _then;

/// Create a copy of PregnancySetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? selectedMethod = freezed,Object? lmpDate = freezed,Object? professionalDueDate = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,selectedMethod: freezed == selectedMethod ? _self.selectedMethod : selectedMethod // ignore: cast_nullable_to_non_nullable
as PregnancyDatingMethod?,lmpDate: freezed == lmpDate ? _self.lmpDate : lmpDate // ignore: cast_nullable_to_non_nullable
as DateTime?,professionalDueDate: freezed == professionalDueDate ? _self.professionalDueDate : professionalDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PregnancySetupState].
extension PregnancySetupStatePatterns on PregnancySetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancySetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancySetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancySetupState value)  $default,){
final _that = this;
switch (_that) {
case _PregnancySetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancySetupState value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancySetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  PregnancyDatingMethod? selectedMethod,  DateTime? lmpDate,  DateTime? professionalDueDate,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancySetupState() when $default != null:
return $default(_that.currentStep,_that.selectedMethod,_that.lmpDate,_that.professionalDueDate,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  PregnancyDatingMethod? selectedMethod,  DateTime? lmpDate,  DateTime? professionalDueDate,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PregnancySetupState():
return $default(_that.currentStep,_that.selectedMethod,_that.lmpDate,_that.professionalDueDate,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  PregnancyDatingMethod? selectedMethod,  DateTime? lmpDate,  DateTime? professionalDueDate,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PregnancySetupState() when $default != null:
return $default(_that.currentStep,_that.selectedMethod,_that.lmpDate,_that.professionalDueDate,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PregnancySetupState implements PregnancySetupState {
  const _PregnancySetupState({this.currentStep = 0, this.selectedMethod, this.lmpDate, this.professionalDueDate, this.isLoading = false, this.error});
  

@override@JsonKey() final  int currentStep;
@override final  PregnancyDatingMethod? selectedMethod;
@override final  DateTime? lmpDate;
@override final  DateTime? professionalDueDate;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PregnancySetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancySetupStateCopyWith<_PregnancySetupState> get copyWith => __$PregnancySetupStateCopyWithImpl<_PregnancySetupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancySetupState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.selectedMethod, selectedMethod) || other.selectedMethod == selectedMethod)&&(identical(other.lmpDate, lmpDate) || other.lmpDate == lmpDate)&&(identical(other.professionalDueDate, professionalDueDate) || other.professionalDueDate == professionalDueDate)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,selectedMethod,lmpDate,professionalDueDate,isLoading,error);

@override
String toString() {
  return 'PregnancySetupState(currentStep: $currentStep, selectedMethod: $selectedMethod, lmpDate: $lmpDate, professionalDueDate: $professionalDueDate, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PregnancySetupStateCopyWith<$Res> implements $PregnancySetupStateCopyWith<$Res> {
  factory _$PregnancySetupStateCopyWith(_PregnancySetupState value, $Res Function(_PregnancySetupState) _then) = __$PregnancySetupStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, PregnancyDatingMethod? selectedMethod, DateTime? lmpDate, DateTime? professionalDueDate, bool isLoading, String? error
});




}
/// @nodoc
class __$PregnancySetupStateCopyWithImpl<$Res>
    implements _$PregnancySetupStateCopyWith<$Res> {
  __$PregnancySetupStateCopyWithImpl(this._self, this._then);

  final _PregnancySetupState _self;
  final $Res Function(_PregnancySetupState) _then;

/// Create a copy of PregnancySetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? selectedMethod = freezed,Object? lmpDate = freezed,Object? professionalDueDate = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PregnancySetupState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,selectedMethod: freezed == selectedMethod ? _self.selectedMethod : selectedMethod // ignore: cast_nullable_to_non_nullable
as PregnancyDatingMethod?,lmpDate: freezed == lmpDate ? _self.lmpDate : lmpDate // ignore: cast_nullable_to_non_nullable
as DateTime?,professionalDueDate: freezed == professionalDueDate ? _self.professionalDueDate : professionalDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
