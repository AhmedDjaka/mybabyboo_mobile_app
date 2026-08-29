// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initializing value)?  initializing,TResult Function( _PlayingNarrative value)?  playingNarrative,TResult Function( _PlayingShort value)?  playingShort,TResult Function( _Completed value)?  completed,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _PlayingNarrative() when playingNarrative != null:
return playingNarrative(_that);case _PlayingShort() when playingShort != null:
return playingShort(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initializing value)  initializing,required TResult Function( _PlayingNarrative value)  playingNarrative,required TResult Function( _PlayingShort value)  playingShort,required TResult Function( _Completed value)  completed,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initializing():
return initializing(_that);case _PlayingNarrative():
return playingNarrative(_that);case _PlayingShort():
return playingShort(_that);case _Completed():
return completed(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initializing value)?  initializing,TResult? Function( _PlayingNarrative value)?  playingNarrative,TResult? Function( _PlayingShort value)?  playingShort,TResult? Function( _Completed value)?  completed,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing(_that);case _PlayingNarrative() when playingNarrative != null:
return playingNarrative(_that);case _PlayingShort() when playingShort != null:
return playingShort(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializing,TResult Function( int currentSceneIndex)?  playingNarrative,TResult Function()?  playingShort,TResult Function( String nextRoute)?  completed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing();case _PlayingNarrative() when playingNarrative != null:
return playingNarrative(_that.currentSceneIndex);case _PlayingShort() when playingShort != null:
return playingShort();case _Completed() when completed != null:
return completed(_that.nextRoute);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializing,required TResult Function( int currentSceneIndex)  playingNarrative,required TResult Function()  playingShort,required TResult Function( String nextRoute)  completed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initializing():
return initializing();case _PlayingNarrative():
return playingNarrative(_that.currentSceneIndex);case _PlayingShort():
return playingShort();case _Completed():
return completed(_that.nextRoute);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializing,TResult? Function( int currentSceneIndex)?  playingNarrative,TResult? Function()?  playingShort,TResult? Function( String nextRoute)?  completed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initializing() when initializing != null:
return initializing();case _PlayingNarrative() when playingNarrative != null:
return playingNarrative(_that.currentSceneIndex);case _PlayingShort() when playingShort != null:
return playingShort();case _Completed() when completed != null:
return completed(_that.nextRoute);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initializing implements SplashState {
  const _Initializing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initializing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initializing()';
}


}




/// @nodoc


class _PlayingNarrative implements SplashState {
  const _PlayingNarrative({required this.currentSceneIndex});
  

 final  int currentSceneIndex;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayingNarrativeCopyWith<_PlayingNarrative> get copyWith => __$PlayingNarrativeCopyWithImpl<_PlayingNarrative>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayingNarrative&&(identical(other.currentSceneIndex, currentSceneIndex) || other.currentSceneIndex == currentSceneIndex));
}


@override
int get hashCode => Object.hash(runtimeType,currentSceneIndex);

@override
String toString() {
  return 'SplashState.playingNarrative(currentSceneIndex: $currentSceneIndex)';
}


}

/// @nodoc
abstract mixin class _$PlayingNarrativeCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$PlayingNarrativeCopyWith(_PlayingNarrative value, $Res Function(_PlayingNarrative) _then) = __$PlayingNarrativeCopyWithImpl;
@useResult
$Res call({
 int currentSceneIndex
});




}
/// @nodoc
class __$PlayingNarrativeCopyWithImpl<$Res>
    implements _$PlayingNarrativeCopyWith<$Res> {
  __$PlayingNarrativeCopyWithImpl(this._self, this._then);

  final _PlayingNarrative _self;
  final $Res Function(_PlayingNarrative) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentSceneIndex = null,}) {
  return _then(_PlayingNarrative(
currentSceneIndex: null == currentSceneIndex ? _self.currentSceneIndex : currentSceneIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _PlayingShort implements SplashState {
  const _PlayingShort();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayingShort);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.playingShort()';
}


}




/// @nodoc


class _Completed implements SplashState {
  const _Completed({required this.nextRoute});
  

 final  String nextRoute;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedCopyWith<_Completed> get copyWith => __$CompletedCopyWithImpl<_Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed&&(identical(other.nextRoute, nextRoute) || other.nextRoute == nextRoute));
}


@override
int get hashCode => Object.hash(runtimeType,nextRoute);

@override
String toString() {
  return 'SplashState.completed(nextRoute: $nextRoute)';
}


}

/// @nodoc
abstract mixin class _$CompletedCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$CompletedCopyWith(_Completed value, $Res Function(_Completed) _then) = __$CompletedCopyWithImpl;
@useResult
$Res call({
 String nextRoute
});




}
/// @nodoc
class __$CompletedCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(this._self, this._then);

  final _Completed _self;
  final $Res Function(_Completed) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nextRoute = null,}) {
  return _then(_Completed(
nextRoute: null == nextRoute ? _self.nextRoute : nextRoute // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements SplashState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
