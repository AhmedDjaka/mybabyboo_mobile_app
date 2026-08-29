// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pregnancy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pregnancy {

 int get id; String get status;@JsonKey(name: 'dating_method') PregnancyDatingMethod get datingMethod;@JsonKey(name: 'last_menstrual_period_date') DateTime? get lastMenstrualPeriodDate;@JsonKey(name: 'due_date') DateTime? get dueDate;@JsonKey(name: 'is_due_date_estimated') bool? get isDueDateEstimated;@JsonKey(name: 'pregnancy_dated') bool get pregnancyDated;@JsonKey(name: 'gestational_age') GestationalAge? get gestationalAge;
/// Create a copy of Pregnancy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyCopyWith<Pregnancy> get copyWith => _$PregnancyCopyWithImpl<Pregnancy>(this as Pregnancy, _$identity);

  /// Serializes this Pregnancy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pregnancy&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.datingMethod, datingMethod) || other.datingMethod == datingMethod)&&(identical(other.lastMenstrualPeriodDate, lastMenstrualPeriodDate) || other.lastMenstrualPeriodDate == lastMenstrualPeriodDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isDueDateEstimated, isDueDateEstimated) || other.isDueDateEstimated == isDueDateEstimated)&&(identical(other.pregnancyDated, pregnancyDated) || other.pregnancyDated == pregnancyDated)&&(identical(other.gestationalAge, gestationalAge) || other.gestationalAge == gestationalAge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,datingMethod,lastMenstrualPeriodDate,dueDate,isDueDateEstimated,pregnancyDated,gestationalAge);

@override
String toString() {
  return 'Pregnancy(id: $id, status: $status, datingMethod: $datingMethod, lastMenstrualPeriodDate: $lastMenstrualPeriodDate, dueDate: $dueDate, isDueDateEstimated: $isDueDateEstimated, pregnancyDated: $pregnancyDated, gestationalAge: $gestationalAge)';
}


}

/// @nodoc
abstract mixin class $PregnancyCopyWith<$Res>  {
  factory $PregnancyCopyWith(Pregnancy value, $Res Function(Pregnancy) _then) = _$PregnancyCopyWithImpl;
@useResult
$Res call({
 int id, String status,@JsonKey(name: 'dating_method') PregnancyDatingMethod datingMethod,@JsonKey(name: 'last_menstrual_period_date') DateTime? lastMenstrualPeriodDate,@JsonKey(name: 'due_date') DateTime? dueDate,@JsonKey(name: 'is_due_date_estimated') bool? isDueDateEstimated,@JsonKey(name: 'pregnancy_dated') bool pregnancyDated,@JsonKey(name: 'gestational_age') GestationalAge? gestationalAge
});


$GestationalAgeCopyWith<$Res>? get gestationalAge;

}
/// @nodoc
class _$PregnancyCopyWithImpl<$Res>
    implements $PregnancyCopyWith<$Res> {
  _$PregnancyCopyWithImpl(this._self, this._then);

  final Pregnancy _self;
  final $Res Function(Pregnancy) _then;

/// Create a copy of Pregnancy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? datingMethod = null,Object? lastMenstrualPeriodDate = freezed,Object? dueDate = freezed,Object? isDueDateEstimated = freezed,Object? pregnancyDated = null,Object? gestationalAge = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,datingMethod: null == datingMethod ? _self.datingMethod : datingMethod // ignore: cast_nullable_to_non_nullable
as PregnancyDatingMethod,lastMenstrualPeriodDate: freezed == lastMenstrualPeriodDate ? _self.lastMenstrualPeriodDate : lastMenstrualPeriodDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isDueDateEstimated: freezed == isDueDateEstimated ? _self.isDueDateEstimated : isDueDateEstimated // ignore: cast_nullable_to_non_nullable
as bool?,pregnancyDated: null == pregnancyDated ? _self.pregnancyDated : pregnancyDated // ignore: cast_nullable_to_non_nullable
as bool,gestationalAge: freezed == gestationalAge ? _self.gestationalAge : gestationalAge // ignore: cast_nullable_to_non_nullable
as GestationalAge?,
  ));
}
/// Create a copy of Pregnancy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GestationalAgeCopyWith<$Res>? get gestationalAge {
    if (_self.gestationalAge == null) {
    return null;
  }

  return $GestationalAgeCopyWith<$Res>(_self.gestationalAge!, (value) {
    return _then(_self.copyWith(gestationalAge: value));
  });
}
}


/// Adds pattern-matching-related methods to [Pregnancy].
extension PregnancyPatterns on Pregnancy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pregnancy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pregnancy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pregnancy value)  $default,){
final _that = this;
switch (_that) {
case _Pregnancy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pregnancy value)?  $default,){
final _that = this;
switch (_that) {
case _Pregnancy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'dating_method')  PregnancyDatingMethod datingMethod, @JsonKey(name: 'last_menstrual_period_date')  DateTime? lastMenstrualPeriodDate, @JsonKey(name: 'due_date')  DateTime? dueDate, @JsonKey(name: 'is_due_date_estimated')  bool? isDueDateEstimated, @JsonKey(name: 'pregnancy_dated')  bool pregnancyDated, @JsonKey(name: 'gestational_age')  GestationalAge? gestationalAge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pregnancy() when $default != null:
return $default(_that.id,_that.status,_that.datingMethod,_that.lastMenstrualPeriodDate,_that.dueDate,_that.isDueDateEstimated,_that.pregnancyDated,_that.gestationalAge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'dating_method')  PregnancyDatingMethod datingMethod, @JsonKey(name: 'last_menstrual_period_date')  DateTime? lastMenstrualPeriodDate, @JsonKey(name: 'due_date')  DateTime? dueDate, @JsonKey(name: 'is_due_date_estimated')  bool? isDueDateEstimated, @JsonKey(name: 'pregnancy_dated')  bool pregnancyDated, @JsonKey(name: 'gestational_age')  GestationalAge? gestationalAge)  $default,) {final _that = this;
switch (_that) {
case _Pregnancy():
return $default(_that.id,_that.status,_that.datingMethod,_that.lastMenstrualPeriodDate,_that.dueDate,_that.isDueDateEstimated,_that.pregnancyDated,_that.gestationalAge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status, @JsonKey(name: 'dating_method')  PregnancyDatingMethod datingMethod, @JsonKey(name: 'last_menstrual_period_date')  DateTime? lastMenstrualPeriodDate, @JsonKey(name: 'due_date')  DateTime? dueDate, @JsonKey(name: 'is_due_date_estimated')  bool? isDueDateEstimated, @JsonKey(name: 'pregnancy_dated')  bool pregnancyDated, @JsonKey(name: 'gestational_age')  GestationalAge? gestationalAge)?  $default,) {final _that = this;
switch (_that) {
case _Pregnancy() when $default != null:
return $default(_that.id,_that.status,_that.datingMethod,_that.lastMenstrualPeriodDate,_that.dueDate,_that.isDueDateEstimated,_that.pregnancyDated,_that.gestationalAge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pregnancy implements Pregnancy {
  const _Pregnancy({required this.id, required this.status, @JsonKey(name: 'dating_method') required this.datingMethod, @JsonKey(name: 'last_menstrual_period_date') this.lastMenstrualPeriodDate, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'is_due_date_estimated') this.isDueDateEstimated, @JsonKey(name: 'pregnancy_dated') required this.pregnancyDated, @JsonKey(name: 'gestational_age') this.gestationalAge});
  factory _Pregnancy.fromJson(Map<String, dynamic> json) => _$PregnancyFromJson(json);

@override final  int id;
@override final  String status;
@override@JsonKey(name: 'dating_method') final  PregnancyDatingMethod datingMethod;
@override@JsonKey(name: 'last_menstrual_period_date') final  DateTime? lastMenstrualPeriodDate;
@override@JsonKey(name: 'due_date') final  DateTime? dueDate;
@override@JsonKey(name: 'is_due_date_estimated') final  bool? isDueDateEstimated;
@override@JsonKey(name: 'pregnancy_dated') final  bool pregnancyDated;
@override@JsonKey(name: 'gestational_age') final  GestationalAge? gestationalAge;

/// Create a copy of Pregnancy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyCopyWith<_Pregnancy> get copyWith => __$PregnancyCopyWithImpl<_Pregnancy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PregnancyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pregnancy&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.datingMethod, datingMethod) || other.datingMethod == datingMethod)&&(identical(other.lastMenstrualPeriodDate, lastMenstrualPeriodDate) || other.lastMenstrualPeriodDate == lastMenstrualPeriodDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isDueDateEstimated, isDueDateEstimated) || other.isDueDateEstimated == isDueDateEstimated)&&(identical(other.pregnancyDated, pregnancyDated) || other.pregnancyDated == pregnancyDated)&&(identical(other.gestationalAge, gestationalAge) || other.gestationalAge == gestationalAge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,datingMethod,lastMenstrualPeriodDate,dueDate,isDueDateEstimated,pregnancyDated,gestationalAge);

@override
String toString() {
  return 'Pregnancy(id: $id, status: $status, datingMethod: $datingMethod, lastMenstrualPeriodDate: $lastMenstrualPeriodDate, dueDate: $dueDate, isDueDateEstimated: $isDueDateEstimated, pregnancyDated: $pregnancyDated, gestationalAge: $gestationalAge)';
}


}

/// @nodoc
abstract mixin class _$PregnancyCopyWith<$Res> implements $PregnancyCopyWith<$Res> {
  factory _$PregnancyCopyWith(_Pregnancy value, $Res Function(_Pregnancy) _then) = __$PregnancyCopyWithImpl;
@override @useResult
$Res call({
 int id, String status,@JsonKey(name: 'dating_method') PregnancyDatingMethod datingMethod,@JsonKey(name: 'last_menstrual_period_date') DateTime? lastMenstrualPeriodDate,@JsonKey(name: 'due_date') DateTime? dueDate,@JsonKey(name: 'is_due_date_estimated') bool? isDueDateEstimated,@JsonKey(name: 'pregnancy_dated') bool pregnancyDated,@JsonKey(name: 'gestational_age') GestationalAge? gestationalAge
});


@override $GestationalAgeCopyWith<$Res>? get gestationalAge;

}
/// @nodoc
class __$PregnancyCopyWithImpl<$Res>
    implements _$PregnancyCopyWith<$Res> {
  __$PregnancyCopyWithImpl(this._self, this._then);

  final _Pregnancy _self;
  final $Res Function(_Pregnancy) _then;

/// Create a copy of Pregnancy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? datingMethod = null,Object? lastMenstrualPeriodDate = freezed,Object? dueDate = freezed,Object? isDueDateEstimated = freezed,Object? pregnancyDated = null,Object? gestationalAge = freezed,}) {
  return _then(_Pregnancy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,datingMethod: null == datingMethod ? _self.datingMethod : datingMethod // ignore: cast_nullable_to_non_nullable
as PregnancyDatingMethod,lastMenstrualPeriodDate: freezed == lastMenstrualPeriodDate ? _self.lastMenstrualPeriodDate : lastMenstrualPeriodDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isDueDateEstimated: freezed == isDueDateEstimated ? _self.isDueDateEstimated : isDueDateEstimated // ignore: cast_nullable_to_non_nullable
as bool?,pregnancyDated: null == pregnancyDated ? _self.pregnancyDated : pregnancyDated // ignore: cast_nullable_to_non_nullable
as bool,gestationalAge: freezed == gestationalAge ? _self.gestationalAge : gestationalAge // ignore: cast_nullable_to_non_nullable
as GestationalAge?,
  ));
}

/// Create a copy of Pregnancy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GestationalAgeCopyWith<$Res>? get gestationalAge {
    if (_self.gestationalAge == null) {
    return null;
  }

  return $GestationalAgeCopyWith<$Res>(_self.gestationalAge!, (value) {
    return _then(_self.copyWith(gestationalAge: value));
  });
}
}

// dart format on
