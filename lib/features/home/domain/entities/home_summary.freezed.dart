// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeSummary {

 HomeUser get user; HomePregnancy? get pregnancy;@JsonKey(name: 'baby_this_week') HomeBabyThisWeek? get babyThisWeek;@JsonKey(name: 'daily_message') String? get dailyMessage;@JsonKey(name: 'next_appointment') HomeNextAppointment? get nextAppointment;
/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSummaryCopyWith<HomeSummary> get copyWith => _$HomeSummaryCopyWithImpl<HomeSummary>(this as HomeSummary, _$identity);

  /// Serializes this HomeSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSummary&&(identical(other.user, user) || other.user == user)&&(identical(other.pregnancy, pregnancy) || other.pregnancy == pregnancy)&&(identical(other.babyThisWeek, babyThisWeek) || other.babyThisWeek == babyThisWeek)&&(identical(other.dailyMessage, dailyMessage) || other.dailyMessage == dailyMessage)&&(identical(other.nextAppointment, nextAppointment) || other.nextAppointment == nextAppointment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,pregnancy,babyThisWeek,dailyMessage,nextAppointment);

@override
String toString() {
  return 'HomeSummary(user: $user, pregnancy: $pregnancy, babyThisWeek: $babyThisWeek, dailyMessage: $dailyMessage, nextAppointment: $nextAppointment)';
}


}

/// @nodoc
abstract mixin class $HomeSummaryCopyWith<$Res>  {
  factory $HomeSummaryCopyWith(HomeSummary value, $Res Function(HomeSummary) _then) = _$HomeSummaryCopyWithImpl;
@useResult
$Res call({
 HomeUser user, HomePregnancy? pregnancy,@JsonKey(name: 'baby_this_week') HomeBabyThisWeek? babyThisWeek,@JsonKey(name: 'daily_message') String? dailyMessage,@JsonKey(name: 'next_appointment') HomeNextAppointment? nextAppointment
});


$HomeUserCopyWith<$Res> get user;$HomePregnancyCopyWith<$Res>? get pregnancy;$HomeBabyThisWeekCopyWith<$Res>? get babyThisWeek;$HomeNextAppointmentCopyWith<$Res>? get nextAppointment;

}
/// @nodoc
class _$HomeSummaryCopyWithImpl<$Res>
    implements $HomeSummaryCopyWith<$Res> {
  _$HomeSummaryCopyWithImpl(this._self, this._then);

  final HomeSummary _self;
  final $Res Function(HomeSummary) _then;

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? pregnancy = freezed,Object? babyThisWeek = freezed,Object? dailyMessage = freezed,Object? nextAppointment = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as HomeUser,pregnancy: freezed == pregnancy ? _self.pregnancy : pregnancy // ignore: cast_nullable_to_non_nullable
as HomePregnancy?,babyThisWeek: freezed == babyThisWeek ? _self.babyThisWeek : babyThisWeek // ignore: cast_nullable_to_non_nullable
as HomeBabyThisWeek?,dailyMessage: freezed == dailyMessage ? _self.dailyMessage : dailyMessage // ignore: cast_nullable_to_non_nullable
as String?,nextAppointment: freezed == nextAppointment ? _self.nextAppointment : nextAppointment // ignore: cast_nullable_to_non_nullable
as HomeNextAppointment?,
  ));
}
/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeUserCopyWith<$Res> get user {
  
  return $HomeUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomePregnancyCopyWith<$Res>? get pregnancy {
    if (_self.pregnancy == null) {
    return null;
  }

  return $HomePregnancyCopyWith<$Res>(_self.pregnancy!, (value) {
    return _then(_self.copyWith(pregnancy: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeBabyThisWeekCopyWith<$Res>? get babyThisWeek {
    if (_self.babyThisWeek == null) {
    return null;
  }

  return $HomeBabyThisWeekCopyWith<$Res>(_self.babyThisWeek!, (value) {
    return _then(_self.copyWith(babyThisWeek: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeNextAppointmentCopyWith<$Res>? get nextAppointment {
    if (_self.nextAppointment == null) {
    return null;
  }

  return $HomeNextAppointmentCopyWith<$Res>(_self.nextAppointment!, (value) {
    return _then(_self.copyWith(nextAppointment: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeSummary].
extension HomeSummaryPatterns on HomeSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSummary value)  $default,){
final _that = this;
switch (_that) {
case _HomeSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSummary value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeUser user,  HomePregnancy? pregnancy, @JsonKey(name: 'baby_this_week')  HomeBabyThisWeek? babyThisWeek, @JsonKey(name: 'daily_message')  String? dailyMessage, @JsonKey(name: 'next_appointment')  HomeNextAppointment? nextAppointment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
return $default(_that.user,_that.pregnancy,_that.babyThisWeek,_that.dailyMessage,_that.nextAppointment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeUser user,  HomePregnancy? pregnancy, @JsonKey(name: 'baby_this_week')  HomeBabyThisWeek? babyThisWeek, @JsonKey(name: 'daily_message')  String? dailyMessage, @JsonKey(name: 'next_appointment')  HomeNextAppointment? nextAppointment)  $default,) {final _that = this;
switch (_that) {
case _HomeSummary():
return $default(_that.user,_that.pregnancy,_that.babyThisWeek,_that.dailyMessage,_that.nextAppointment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeUser user,  HomePregnancy? pregnancy, @JsonKey(name: 'baby_this_week')  HomeBabyThisWeek? babyThisWeek, @JsonKey(name: 'daily_message')  String? dailyMessage, @JsonKey(name: 'next_appointment')  HomeNextAppointment? nextAppointment)?  $default,) {final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
return $default(_that.user,_that.pregnancy,_that.babyThisWeek,_that.dailyMessage,_that.nextAppointment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSummary implements HomeSummary {
  const _HomeSummary({required this.user, this.pregnancy, @JsonKey(name: 'baby_this_week') this.babyThisWeek, @JsonKey(name: 'daily_message') this.dailyMessage, @JsonKey(name: 'next_appointment') this.nextAppointment});
  factory _HomeSummary.fromJson(Map<String, dynamic> json) => _$HomeSummaryFromJson(json);

@override final  HomeUser user;
@override final  HomePregnancy? pregnancy;
@override@JsonKey(name: 'baby_this_week') final  HomeBabyThisWeek? babyThisWeek;
@override@JsonKey(name: 'daily_message') final  String? dailyMessage;
@override@JsonKey(name: 'next_appointment') final  HomeNextAppointment? nextAppointment;

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSummaryCopyWith<_HomeSummary> get copyWith => __$HomeSummaryCopyWithImpl<_HomeSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSummary&&(identical(other.user, user) || other.user == user)&&(identical(other.pregnancy, pregnancy) || other.pregnancy == pregnancy)&&(identical(other.babyThisWeek, babyThisWeek) || other.babyThisWeek == babyThisWeek)&&(identical(other.dailyMessage, dailyMessage) || other.dailyMessage == dailyMessage)&&(identical(other.nextAppointment, nextAppointment) || other.nextAppointment == nextAppointment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,pregnancy,babyThisWeek,dailyMessage,nextAppointment);

@override
String toString() {
  return 'HomeSummary(user: $user, pregnancy: $pregnancy, babyThisWeek: $babyThisWeek, dailyMessage: $dailyMessage, nextAppointment: $nextAppointment)';
}


}

/// @nodoc
abstract mixin class _$HomeSummaryCopyWith<$Res> implements $HomeSummaryCopyWith<$Res> {
  factory _$HomeSummaryCopyWith(_HomeSummary value, $Res Function(_HomeSummary) _then) = __$HomeSummaryCopyWithImpl;
@override @useResult
$Res call({
 HomeUser user, HomePregnancy? pregnancy,@JsonKey(name: 'baby_this_week') HomeBabyThisWeek? babyThisWeek,@JsonKey(name: 'daily_message') String? dailyMessage,@JsonKey(name: 'next_appointment') HomeNextAppointment? nextAppointment
});


@override $HomeUserCopyWith<$Res> get user;@override $HomePregnancyCopyWith<$Res>? get pregnancy;@override $HomeBabyThisWeekCopyWith<$Res>? get babyThisWeek;@override $HomeNextAppointmentCopyWith<$Res>? get nextAppointment;

}
/// @nodoc
class __$HomeSummaryCopyWithImpl<$Res>
    implements _$HomeSummaryCopyWith<$Res> {
  __$HomeSummaryCopyWithImpl(this._self, this._then);

  final _HomeSummary _self;
  final $Res Function(_HomeSummary) _then;

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? pregnancy = freezed,Object? babyThisWeek = freezed,Object? dailyMessage = freezed,Object? nextAppointment = freezed,}) {
  return _then(_HomeSummary(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as HomeUser,pregnancy: freezed == pregnancy ? _self.pregnancy : pregnancy // ignore: cast_nullable_to_non_nullable
as HomePregnancy?,babyThisWeek: freezed == babyThisWeek ? _self.babyThisWeek : babyThisWeek // ignore: cast_nullable_to_non_nullable
as HomeBabyThisWeek?,dailyMessage: freezed == dailyMessage ? _self.dailyMessage : dailyMessage // ignore: cast_nullable_to_non_nullable
as String?,nextAppointment: freezed == nextAppointment ? _self.nextAppointment : nextAppointment // ignore: cast_nullable_to_non_nullable
as HomeNextAppointment?,
  ));
}

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeUserCopyWith<$Res> get user {
  
  return $HomeUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomePregnancyCopyWith<$Res>? get pregnancy {
    if (_self.pregnancy == null) {
    return null;
  }

  return $HomePregnancyCopyWith<$Res>(_self.pregnancy!, (value) {
    return _then(_self.copyWith(pregnancy: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeBabyThisWeekCopyWith<$Res>? get babyThisWeek {
    if (_self.babyThisWeek == null) {
    return null;
  }

  return $HomeBabyThisWeekCopyWith<$Res>(_self.babyThisWeek!, (value) {
    return _then(_self.copyWith(babyThisWeek: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeNextAppointmentCopyWith<$Res>? get nextAppointment {
    if (_self.nextAppointment == null) {
    return null;
  }

  return $HomeNextAppointmentCopyWith<$Res>(_self.nextAppointment!, (value) {
    return _then(_self.copyWith(nextAppointment: value));
  });
}
}


/// @nodoc
mixin _$HomeUser {

@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'profile_photo_url') String? get profilePhotoUrl;
/// Create a copy of HomeUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUserCopyWith<HomeUser> get copyWith => _$HomeUserCopyWithImpl<HomeUser>(this as HomeUser, _$identity);

  /// Serializes this HomeUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUser&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,profilePhotoUrl);

@override
String toString() {
  return 'HomeUser(displayName: $displayName, profilePhotoUrl: $profilePhotoUrl)';
}


}

/// @nodoc
abstract mixin class $HomeUserCopyWith<$Res>  {
  factory $HomeUserCopyWith(HomeUser value, $Res Function(HomeUser) _then) = _$HomeUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl
});




}
/// @nodoc
class _$HomeUserCopyWithImpl<$Res>
    implements $HomeUserCopyWith<$Res> {
  _$HomeUserCopyWithImpl(this._self, this._then);

  final HomeUser _self;
  final $Res Function(HomeUser) _then;

/// Create a copy of HomeUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? profilePhotoUrl = freezed,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeUser].
extension HomeUserPatterns on HomeUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeUser value)  $default,){
final _that = this;
switch (_that) {
case _HomeUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeUser value)?  $default,){
final _that = this;
switch (_that) {
case _HomeUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeUser() when $default != null:
return $default(_that.displayName,_that.profilePhotoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl)  $default,) {final _that = this;
switch (_that) {
case _HomeUser():
return $default(_that.displayName,_that.profilePhotoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl)?  $default,) {final _that = this;
switch (_that) {
case _HomeUser() when $default != null:
return $default(_that.displayName,_that.profilePhotoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeUser implements HomeUser {
  const _HomeUser({@JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl});
  factory _HomeUser.fromJson(Map<String, dynamic> json) => _$HomeUserFromJson(json);

@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'profile_photo_url') final  String? profilePhotoUrl;

/// Create a copy of HomeUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeUserCopyWith<_HomeUser> get copyWith => __$HomeUserCopyWithImpl<_HomeUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeUser&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,profilePhotoUrl);

@override
String toString() {
  return 'HomeUser(displayName: $displayName, profilePhotoUrl: $profilePhotoUrl)';
}


}

/// @nodoc
abstract mixin class _$HomeUserCopyWith<$Res> implements $HomeUserCopyWith<$Res> {
  factory _$HomeUserCopyWith(_HomeUser value, $Res Function(_HomeUser) _then) = __$HomeUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl
});




}
/// @nodoc
class __$HomeUserCopyWithImpl<$Res>
    implements _$HomeUserCopyWith<$Res> {
  __$HomeUserCopyWithImpl(this._self, this._then);

  final _HomeUser _self;
  final $Res Function(_HomeUser) _then;

/// Create a copy of HomeUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? profilePhotoUrl = freezed,}) {
  return _then(_HomeUser(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HomePregnancy {

@JsonKey(name: 'pregnancy_dated') bool get pregnancyDated;@JsonKey(name: 'dating_method') String get datingMethod;@JsonKey(name: 'due_date') String? get dueDate;@JsonKey(name: 'gestational_age') HomeGestationalAge? get gestationalAge; int? get trimester;@JsonKey(name: 'progress_percentage') int? get progressPercentage;
/// Create a copy of HomePregnancy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePregnancyCopyWith<HomePregnancy> get copyWith => _$HomePregnancyCopyWithImpl<HomePregnancy>(this as HomePregnancy, _$identity);

  /// Serializes this HomePregnancy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePregnancy&&(identical(other.pregnancyDated, pregnancyDated) || other.pregnancyDated == pregnancyDated)&&(identical(other.datingMethod, datingMethod) || other.datingMethod == datingMethod)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.gestationalAge, gestationalAge) || other.gestationalAge == gestationalAge)&&(identical(other.trimester, trimester) || other.trimester == trimester)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pregnancyDated,datingMethod,dueDate,gestationalAge,trimester,progressPercentage);

@override
String toString() {
  return 'HomePregnancy(pregnancyDated: $pregnancyDated, datingMethod: $datingMethod, dueDate: $dueDate, gestationalAge: $gestationalAge, trimester: $trimester, progressPercentage: $progressPercentage)';
}


}

/// @nodoc
abstract mixin class $HomePregnancyCopyWith<$Res>  {
  factory $HomePregnancyCopyWith(HomePregnancy value, $Res Function(HomePregnancy) _then) = _$HomePregnancyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'pregnancy_dated') bool pregnancyDated,@JsonKey(name: 'dating_method') String datingMethod,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'gestational_age') HomeGestationalAge? gestationalAge, int? trimester,@JsonKey(name: 'progress_percentage') int? progressPercentage
});


$HomeGestationalAgeCopyWith<$Res>? get gestationalAge;

}
/// @nodoc
class _$HomePregnancyCopyWithImpl<$Res>
    implements $HomePregnancyCopyWith<$Res> {
  _$HomePregnancyCopyWithImpl(this._self, this._then);

  final HomePregnancy _self;
  final $Res Function(HomePregnancy) _then;

/// Create a copy of HomePregnancy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pregnancyDated = null,Object? datingMethod = null,Object? dueDate = freezed,Object? gestationalAge = freezed,Object? trimester = freezed,Object? progressPercentage = freezed,}) {
  return _then(_self.copyWith(
pregnancyDated: null == pregnancyDated ? _self.pregnancyDated : pregnancyDated // ignore: cast_nullable_to_non_nullable
as bool,datingMethod: null == datingMethod ? _self.datingMethod : datingMethod // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,gestationalAge: freezed == gestationalAge ? _self.gestationalAge : gestationalAge // ignore: cast_nullable_to_non_nullable
as HomeGestationalAge?,trimester: freezed == trimester ? _self.trimester : trimester // ignore: cast_nullable_to_non_nullable
as int?,progressPercentage: freezed == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of HomePregnancy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeGestationalAgeCopyWith<$Res>? get gestationalAge {
    if (_self.gestationalAge == null) {
    return null;
  }

  return $HomeGestationalAgeCopyWith<$Res>(_self.gestationalAge!, (value) {
    return _then(_self.copyWith(gestationalAge: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomePregnancy].
extension HomePregnancyPatterns on HomePregnancy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomePregnancy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomePregnancy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomePregnancy value)  $default,){
final _that = this;
switch (_that) {
case _HomePregnancy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomePregnancy value)?  $default,){
final _that = this;
switch (_that) {
case _HomePregnancy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'pregnancy_dated')  bool pregnancyDated, @JsonKey(name: 'dating_method')  String datingMethod, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'gestational_age')  HomeGestationalAge? gestationalAge,  int? trimester, @JsonKey(name: 'progress_percentage')  int? progressPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomePregnancy() when $default != null:
return $default(_that.pregnancyDated,_that.datingMethod,_that.dueDate,_that.gestationalAge,_that.trimester,_that.progressPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'pregnancy_dated')  bool pregnancyDated, @JsonKey(name: 'dating_method')  String datingMethod, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'gestational_age')  HomeGestationalAge? gestationalAge,  int? trimester, @JsonKey(name: 'progress_percentage')  int? progressPercentage)  $default,) {final _that = this;
switch (_that) {
case _HomePregnancy():
return $default(_that.pregnancyDated,_that.datingMethod,_that.dueDate,_that.gestationalAge,_that.trimester,_that.progressPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'pregnancy_dated')  bool pregnancyDated, @JsonKey(name: 'dating_method')  String datingMethod, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'gestational_age')  HomeGestationalAge? gestationalAge,  int? trimester, @JsonKey(name: 'progress_percentage')  int? progressPercentage)?  $default,) {final _that = this;
switch (_that) {
case _HomePregnancy() when $default != null:
return $default(_that.pregnancyDated,_that.datingMethod,_that.dueDate,_that.gestationalAge,_that.trimester,_that.progressPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomePregnancy implements HomePregnancy {
  const _HomePregnancy({@JsonKey(name: 'pregnancy_dated') required this.pregnancyDated, @JsonKey(name: 'dating_method') required this.datingMethod, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'gestational_age') this.gestationalAge, this.trimester, @JsonKey(name: 'progress_percentage') this.progressPercentage});
  factory _HomePregnancy.fromJson(Map<String, dynamic> json) => _$HomePregnancyFromJson(json);

@override@JsonKey(name: 'pregnancy_dated') final  bool pregnancyDated;
@override@JsonKey(name: 'dating_method') final  String datingMethod;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey(name: 'gestational_age') final  HomeGestationalAge? gestationalAge;
@override final  int? trimester;
@override@JsonKey(name: 'progress_percentage') final  int? progressPercentage;

/// Create a copy of HomePregnancy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePregnancyCopyWith<_HomePregnancy> get copyWith => __$HomePregnancyCopyWithImpl<_HomePregnancy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomePregnancyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePregnancy&&(identical(other.pregnancyDated, pregnancyDated) || other.pregnancyDated == pregnancyDated)&&(identical(other.datingMethod, datingMethod) || other.datingMethod == datingMethod)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.gestationalAge, gestationalAge) || other.gestationalAge == gestationalAge)&&(identical(other.trimester, trimester) || other.trimester == trimester)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pregnancyDated,datingMethod,dueDate,gestationalAge,trimester,progressPercentage);

@override
String toString() {
  return 'HomePregnancy(pregnancyDated: $pregnancyDated, datingMethod: $datingMethod, dueDate: $dueDate, gestationalAge: $gestationalAge, trimester: $trimester, progressPercentage: $progressPercentage)';
}


}

/// @nodoc
abstract mixin class _$HomePregnancyCopyWith<$Res> implements $HomePregnancyCopyWith<$Res> {
  factory _$HomePregnancyCopyWith(_HomePregnancy value, $Res Function(_HomePregnancy) _then) = __$HomePregnancyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'pregnancy_dated') bool pregnancyDated,@JsonKey(name: 'dating_method') String datingMethod,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'gestational_age') HomeGestationalAge? gestationalAge, int? trimester,@JsonKey(name: 'progress_percentage') int? progressPercentage
});


@override $HomeGestationalAgeCopyWith<$Res>? get gestationalAge;

}
/// @nodoc
class __$HomePregnancyCopyWithImpl<$Res>
    implements _$HomePregnancyCopyWith<$Res> {
  __$HomePregnancyCopyWithImpl(this._self, this._then);

  final _HomePregnancy _self;
  final $Res Function(_HomePregnancy) _then;

/// Create a copy of HomePregnancy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pregnancyDated = null,Object? datingMethod = null,Object? dueDate = freezed,Object? gestationalAge = freezed,Object? trimester = freezed,Object? progressPercentage = freezed,}) {
  return _then(_HomePregnancy(
pregnancyDated: null == pregnancyDated ? _self.pregnancyDated : pregnancyDated // ignore: cast_nullable_to_non_nullable
as bool,datingMethod: null == datingMethod ? _self.datingMethod : datingMethod // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,gestationalAge: freezed == gestationalAge ? _self.gestationalAge : gestationalAge // ignore: cast_nullable_to_non_nullable
as HomeGestationalAge?,trimester: freezed == trimester ? _self.trimester : trimester // ignore: cast_nullable_to_non_nullable
as int?,progressPercentage: freezed == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of HomePregnancy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeGestationalAgeCopyWith<$Res>? get gestationalAge {
    if (_self.gestationalAge == null) {
    return null;
  }

  return $HomeGestationalAgeCopyWith<$Res>(_self.gestationalAge!, (value) {
    return _then(_self.copyWith(gestationalAge: value));
  });
}
}


/// @nodoc
mixin _$HomeGestationalAge {

@JsonKey(name: 'total_days') int get totalDays; int get weeks; int get days;
/// Create a copy of HomeGestationalAge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeGestationalAgeCopyWith<HomeGestationalAge> get copyWith => _$HomeGestationalAgeCopyWithImpl<HomeGestationalAge>(this as HomeGestationalAge, _$identity);

  /// Serializes this HomeGestationalAge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeGestationalAge&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&(identical(other.days, days) || other.days == days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,weeks,days);

@override
String toString() {
  return 'HomeGestationalAge(totalDays: $totalDays, weeks: $weeks, days: $days)';
}


}

/// @nodoc
abstract mixin class $HomeGestationalAgeCopyWith<$Res>  {
  factory $HomeGestationalAgeCopyWith(HomeGestationalAge value, $Res Function(HomeGestationalAge) _then) = _$HomeGestationalAgeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_days') int totalDays, int weeks, int days
});




}
/// @nodoc
class _$HomeGestationalAgeCopyWithImpl<$Res>
    implements $HomeGestationalAgeCopyWith<$Res> {
  _$HomeGestationalAgeCopyWithImpl(this._self, this._then);

  final HomeGestationalAge _self;
  final $Res Function(HomeGestationalAge) _then;

/// Create a copy of HomeGestationalAge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDays = null,Object? weeks = null,Object? days = null,}) {
  return _then(_self.copyWith(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeGestationalAge].
extension HomeGestationalAgePatterns on HomeGestationalAge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeGestationalAge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeGestationalAge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeGestationalAge value)  $default,){
final _that = this;
switch (_that) {
case _HomeGestationalAge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeGestationalAge value)?  $default,){
final _that = this;
switch (_that) {
case _HomeGestationalAge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_days')  int totalDays,  int weeks,  int days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeGestationalAge() when $default != null:
return $default(_that.totalDays,_that.weeks,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_days')  int totalDays,  int weeks,  int days)  $default,) {final _that = this;
switch (_that) {
case _HomeGestationalAge():
return $default(_that.totalDays,_that.weeks,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_days')  int totalDays,  int weeks,  int days)?  $default,) {final _that = this;
switch (_that) {
case _HomeGestationalAge() when $default != null:
return $default(_that.totalDays,_that.weeks,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeGestationalAge implements HomeGestationalAge {
  const _HomeGestationalAge({@JsonKey(name: 'total_days') required this.totalDays, required this.weeks, required this.days});
  factory _HomeGestationalAge.fromJson(Map<String, dynamic> json) => _$HomeGestationalAgeFromJson(json);

@override@JsonKey(name: 'total_days') final  int totalDays;
@override final  int weeks;
@override final  int days;

/// Create a copy of HomeGestationalAge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeGestationalAgeCopyWith<_HomeGestationalAge> get copyWith => __$HomeGestationalAgeCopyWithImpl<_HomeGestationalAge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeGestationalAgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeGestationalAge&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&(identical(other.days, days) || other.days == days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,weeks,days);

@override
String toString() {
  return 'HomeGestationalAge(totalDays: $totalDays, weeks: $weeks, days: $days)';
}


}

/// @nodoc
abstract mixin class _$HomeGestationalAgeCopyWith<$Res> implements $HomeGestationalAgeCopyWith<$Res> {
  factory _$HomeGestationalAgeCopyWith(_HomeGestationalAge value, $Res Function(_HomeGestationalAge) _then) = __$HomeGestationalAgeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_days') int totalDays, int weeks, int days
});




}
/// @nodoc
class __$HomeGestationalAgeCopyWithImpl<$Res>
    implements _$HomeGestationalAgeCopyWith<$Res> {
  __$HomeGestationalAgeCopyWithImpl(this._self, this._then);

  final _HomeGestationalAge _self;
  final $Res Function(_HomeGestationalAge) _then;

/// Create a copy of HomeGestationalAge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDays = null,Object? weeks = null,Object? days = null,}) {
  return _then(_HomeGestationalAge(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeBabyThisWeek {

 int get week; String get title; String get summary;@JsonKey(name: 'size_cm') double? get sizeCm;@JsonKey(name: 'weight_g') int? get weightG;@JsonKey(name: 'fruit_comparison') String? get fruitComparison;
/// Create a copy of HomeBabyThisWeek
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBabyThisWeekCopyWith<HomeBabyThisWeek> get copyWith => _$HomeBabyThisWeekCopyWithImpl<HomeBabyThisWeek>(this as HomeBabyThisWeek, _$identity);

  /// Serializes this HomeBabyThisWeek to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBabyThisWeek&&(identical(other.week, week) || other.week == week)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.sizeCm, sizeCm) || other.sizeCm == sizeCm)&&(identical(other.weightG, weightG) || other.weightG == weightG)&&(identical(other.fruitComparison, fruitComparison) || other.fruitComparison == fruitComparison));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,title,summary,sizeCm,weightG,fruitComparison);

@override
String toString() {
  return 'HomeBabyThisWeek(week: $week, title: $title, summary: $summary, sizeCm: $sizeCm, weightG: $weightG, fruitComparison: $fruitComparison)';
}


}

/// @nodoc
abstract mixin class $HomeBabyThisWeekCopyWith<$Res>  {
  factory $HomeBabyThisWeekCopyWith(HomeBabyThisWeek value, $Res Function(HomeBabyThisWeek) _then) = _$HomeBabyThisWeekCopyWithImpl;
@useResult
$Res call({
 int week, String title, String summary,@JsonKey(name: 'size_cm') double? sizeCm,@JsonKey(name: 'weight_g') int? weightG,@JsonKey(name: 'fruit_comparison') String? fruitComparison
});




}
/// @nodoc
class _$HomeBabyThisWeekCopyWithImpl<$Res>
    implements $HomeBabyThisWeekCopyWith<$Res> {
  _$HomeBabyThisWeekCopyWithImpl(this._self, this._then);

  final HomeBabyThisWeek _self;
  final $Res Function(HomeBabyThisWeek) _then;

/// Create a copy of HomeBabyThisWeek
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? title = null,Object? summary = null,Object? sizeCm = freezed,Object? weightG = freezed,Object? fruitComparison = freezed,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,sizeCm: freezed == sizeCm ? _self.sizeCm : sizeCm // ignore: cast_nullable_to_non_nullable
as double?,weightG: freezed == weightG ? _self.weightG : weightG // ignore: cast_nullable_to_non_nullable
as int?,fruitComparison: freezed == fruitComparison ? _self.fruitComparison : fruitComparison // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeBabyThisWeek].
extension HomeBabyThisWeekPatterns on HomeBabyThisWeek {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeBabyThisWeek value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBabyThisWeek() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeBabyThisWeek value)  $default,){
final _that = this;
switch (_that) {
case _HomeBabyThisWeek():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeBabyThisWeek value)?  $default,){
final _that = this;
switch (_that) {
case _HomeBabyThisWeek() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int week,  String title,  String summary, @JsonKey(name: 'size_cm')  double? sizeCm, @JsonKey(name: 'weight_g')  int? weightG, @JsonKey(name: 'fruit_comparison')  String? fruitComparison)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeBabyThisWeek() when $default != null:
return $default(_that.week,_that.title,_that.summary,_that.sizeCm,_that.weightG,_that.fruitComparison);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int week,  String title,  String summary, @JsonKey(name: 'size_cm')  double? sizeCm, @JsonKey(name: 'weight_g')  int? weightG, @JsonKey(name: 'fruit_comparison')  String? fruitComparison)  $default,) {final _that = this;
switch (_that) {
case _HomeBabyThisWeek():
return $default(_that.week,_that.title,_that.summary,_that.sizeCm,_that.weightG,_that.fruitComparison);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int week,  String title,  String summary, @JsonKey(name: 'size_cm')  double? sizeCm, @JsonKey(name: 'weight_g')  int? weightG, @JsonKey(name: 'fruit_comparison')  String? fruitComparison)?  $default,) {final _that = this;
switch (_that) {
case _HomeBabyThisWeek() when $default != null:
return $default(_that.week,_that.title,_that.summary,_that.sizeCm,_that.weightG,_that.fruitComparison);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeBabyThisWeek implements HomeBabyThisWeek {
  const _HomeBabyThisWeek({required this.week, required this.title, required this.summary, @JsonKey(name: 'size_cm') this.sizeCm, @JsonKey(name: 'weight_g') this.weightG, @JsonKey(name: 'fruit_comparison') this.fruitComparison});
  factory _HomeBabyThisWeek.fromJson(Map<String, dynamic> json) => _$HomeBabyThisWeekFromJson(json);

@override final  int week;
@override final  String title;
@override final  String summary;
@override@JsonKey(name: 'size_cm') final  double? sizeCm;
@override@JsonKey(name: 'weight_g') final  int? weightG;
@override@JsonKey(name: 'fruit_comparison') final  String? fruitComparison;

/// Create a copy of HomeBabyThisWeek
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBabyThisWeekCopyWith<_HomeBabyThisWeek> get copyWith => __$HomeBabyThisWeekCopyWithImpl<_HomeBabyThisWeek>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeBabyThisWeekToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBabyThisWeek&&(identical(other.week, week) || other.week == week)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.sizeCm, sizeCm) || other.sizeCm == sizeCm)&&(identical(other.weightG, weightG) || other.weightG == weightG)&&(identical(other.fruitComparison, fruitComparison) || other.fruitComparison == fruitComparison));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,title,summary,sizeCm,weightG,fruitComparison);

@override
String toString() {
  return 'HomeBabyThisWeek(week: $week, title: $title, summary: $summary, sizeCm: $sizeCm, weightG: $weightG, fruitComparison: $fruitComparison)';
}


}

/// @nodoc
abstract mixin class _$HomeBabyThisWeekCopyWith<$Res> implements $HomeBabyThisWeekCopyWith<$Res> {
  factory _$HomeBabyThisWeekCopyWith(_HomeBabyThisWeek value, $Res Function(_HomeBabyThisWeek) _then) = __$HomeBabyThisWeekCopyWithImpl;
@override @useResult
$Res call({
 int week, String title, String summary,@JsonKey(name: 'size_cm') double? sizeCm,@JsonKey(name: 'weight_g') int? weightG,@JsonKey(name: 'fruit_comparison') String? fruitComparison
});




}
/// @nodoc
class __$HomeBabyThisWeekCopyWithImpl<$Res>
    implements _$HomeBabyThisWeekCopyWith<$Res> {
  __$HomeBabyThisWeekCopyWithImpl(this._self, this._then);

  final _HomeBabyThisWeek _self;
  final $Res Function(_HomeBabyThisWeek) _then;

/// Create a copy of HomeBabyThisWeek
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? title = null,Object? summary = null,Object? sizeCm = freezed,Object? weightG = freezed,Object? fruitComparison = freezed,}) {
  return _then(_HomeBabyThisWeek(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,sizeCm: freezed == sizeCm ? _self.sizeCm : sizeCm // ignore: cast_nullable_to_non_nullable
as double?,weightG: freezed == weightG ? _self.weightG : weightG // ignore: cast_nullable_to_non_nullable
as int?,fruitComparison: freezed == fruitComparison ? _self.fruitComparison : fruitComparison // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HomeNextAppointment {

 int get id; String get title;@JsonKey(name: 'appointment_date') DateTime get appointmentDate;
/// Create a copy of HomeNextAppointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeNextAppointmentCopyWith<HomeNextAppointment> get copyWith => _$HomeNextAppointmentCopyWithImpl<HomeNextAppointment>(this as HomeNextAppointment, _$identity);

  /// Serializes this HomeNextAppointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeNextAppointment&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,appointmentDate);

@override
String toString() {
  return 'HomeNextAppointment(id: $id, title: $title, appointmentDate: $appointmentDate)';
}


}

/// @nodoc
abstract mixin class $HomeNextAppointmentCopyWith<$Res>  {
  factory $HomeNextAppointmentCopyWith(HomeNextAppointment value, $Res Function(HomeNextAppointment) _then) = _$HomeNextAppointmentCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'appointment_date') DateTime appointmentDate
});




}
/// @nodoc
class _$HomeNextAppointmentCopyWithImpl<$Res>
    implements $HomeNextAppointmentCopyWith<$Res> {
  _$HomeNextAppointmentCopyWithImpl(this._self, this._then);

  final HomeNextAppointment _self;
  final $Res Function(HomeNextAppointment) _then;

/// Create a copy of HomeNextAppointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? appointmentDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeNextAppointment].
extension HomeNextAppointmentPatterns on HomeNextAppointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeNextAppointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeNextAppointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeNextAppointment value)  $default,){
final _that = this;
switch (_that) {
case _HomeNextAppointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeNextAppointment value)?  $default,){
final _that = this;
switch (_that) {
case _HomeNextAppointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'appointment_date')  DateTime appointmentDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeNextAppointment() when $default != null:
return $default(_that.id,_that.title,_that.appointmentDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'appointment_date')  DateTime appointmentDate)  $default,) {final _that = this;
switch (_that) {
case _HomeNextAppointment():
return $default(_that.id,_that.title,_that.appointmentDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'appointment_date')  DateTime appointmentDate)?  $default,) {final _that = this;
switch (_that) {
case _HomeNextAppointment() when $default != null:
return $default(_that.id,_that.title,_that.appointmentDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeNextAppointment implements HomeNextAppointment {
  const _HomeNextAppointment({required this.id, required this.title, @JsonKey(name: 'appointment_date') required this.appointmentDate});
  factory _HomeNextAppointment.fromJson(Map<String, dynamic> json) => _$HomeNextAppointmentFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'appointment_date') final  DateTime appointmentDate;

/// Create a copy of HomeNextAppointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeNextAppointmentCopyWith<_HomeNextAppointment> get copyWith => __$HomeNextAppointmentCopyWithImpl<_HomeNextAppointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeNextAppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeNextAppointment&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,appointmentDate);

@override
String toString() {
  return 'HomeNextAppointment(id: $id, title: $title, appointmentDate: $appointmentDate)';
}


}

/// @nodoc
abstract mixin class _$HomeNextAppointmentCopyWith<$Res> implements $HomeNextAppointmentCopyWith<$Res> {
  factory _$HomeNextAppointmentCopyWith(_HomeNextAppointment value, $Res Function(_HomeNextAppointment) _then) = __$HomeNextAppointmentCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'appointment_date') DateTime appointmentDate
});




}
/// @nodoc
class __$HomeNextAppointmentCopyWithImpl<$Res>
    implements _$HomeNextAppointmentCopyWith<$Res> {
  __$HomeNextAppointmentCopyWithImpl(this._self, this._then);

  final _HomeNextAppointment _self;
  final $Res Function(_HomeNextAppointment) _then;

/// Create a copy of HomeNextAppointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? appointmentDate = null,}) {
  return _then(_HomeNextAppointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,appointmentDate: null == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
