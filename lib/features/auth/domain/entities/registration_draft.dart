import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_draft.freezed.dart';
part 'registration_draft.g.dart';

@freezed
abstract class RegistrationDraft with _$RegistrationDraft {
  const factory RegistrationDraft({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phone,
    @Default('') String verificationId,
    @Default('') String destinationMasked,
    @Default(0) int expiresIn,
    @Default('') String password,
    @Default('') String email,
    @Default(false) bool acceptedTerms,
    @Default('') String verificationToken,
  }) = _RegistrationDraft;

  factory RegistrationDraft.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDraftFromJson(json);
}
