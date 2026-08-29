import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_user.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required AuthUser user,
    @JsonKey(name: 'profile_completed') required bool profileCompleted,
    @JsonKey(name: 'pregnancy_configured') required bool pregnancyConfigured,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}
