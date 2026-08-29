import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baby_mama/features/auth/presentation/viewmodels/register_viewmodel.dart';
import 'package:baby_mama/features/auth/domain/repositories/auth_repository.dart';
import 'package:baby_mama/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:baby_mama/features/auth/domain/entities/auth_session.dart';
import 'package:baby_mama/features/auth/domain/entities/auth_user.dart';
import 'package:baby_mama/features/auth/domain/entities/registration_draft.dart';

class StubAuthRepository implements AuthRepository {
  @override
  Future<Map<String, dynamic>> startRegistration(String phone) async {
    return {
      'verification_id': 'id_1',
      'destination_masked': '+22507******01',
      'expires_in': 600,
    };
  }

  @override
  Future<Map<String, dynamic>> resendRegistrationOtp(
    String verificationId,
  ) async {
    return {'message': 'OTP renvoyé', 'verification_id': 'id_2'};
  }

  @override
  Future<String> verifyRegistration(String verificationId, String code) async {
    if (verificationId == 'id_1') {
      throw Exception('Invalid verification_id');
    }
    return 'token_123';
  }

  @override
  Future<bool> checkPregnancyConfigured() async => false;

  @override
  Future<bool> checkProfileCompleted() async => false;

  @override
  Future<AuthUser> completeRegistration(RegistrationDraft draft) async {
    return const AuthUser(id: 1, phone: '1234', name: 'User');
  }

  @override
  Future<AuthSession> fetchSession() async {
    return const AuthSession(
      user: AuthUser(id: 1, phone: '1234', name: 'User'),
      profileCompleted: false,
      pregnancyConfigured: false,
    );
  }

  @override
  Future<void> forgotPassword(String phone) async {}

  @override
  Future<AuthSession> login(String phone, String password) async {
    return const AuthSession(
      user: AuthUser(id: 1, phone: '1234', name: 'User'),
      profileCompleted: false,
      pregnancyConfigured: false,
    );
  }

  @override
  Future<void> logout() async {}

  @override
  Future<void> resetPassword(String phone, String password) async {}

  @override
  Future<void> verifyPasswordReset(String phone, String code) async {}
}

void main() {
  late ProviderContainer container;
  late StubAuthRepository mockRepository;

  setUp(() {
    mockRepository = StubAuthRepository();
    container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWithValue(mockRepository)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('RegisterViewModel keeps identity across state changes', () {
    final notifier = container.read(registerViewModelProvider.notifier);

    notifier.updateIdentity('John', 'Doe');
    notifier.updatePhone('+2250700000001');

    final state = container.read(registerViewModelProvider);
    expect(state.firstName, 'John');
    expect(state.lastName, 'Doe');
    expect(state.phone, '+2250700000001');
  });

  test(
    'startRegistration stores verificationId and destinationMasked',
    () async {
      final notifier = container.read(registerViewModelProvider.notifier);
      notifier.updatePhone('+2250700000001');

      await notifier.startRegistration();

      final state = container.read(registerViewModelProvider);
      expect(state.verificationId, 'id_1');
      expect(state.destinationMasked, '+22507******01');
      expect(state.expiresIn, 600);
    },
  );

  test(
    'resendOtp replaces verificationId but keeps destinationMasked',
    () async {
      final notifier = container.read(registerViewModelProvider.notifier);
      notifier.updatePhone('+2250700000001');

      await notifier.startRegistration();
      await notifier.resendOtp();

      final state = container.read(registerViewModelProvider);
      expect(state.verificationId, 'id_2');
      expect(state.destinationMasked, '+22507******01'); // Survives resend
    },
  );

  test('resetRegistration clears everything', () async {
    final notifier = container.read(registerViewModelProvider.notifier);
    notifier.updateIdentity('John', 'Doe');
    notifier.updatePhone('+2250700000001');

    await notifier.startRegistration();
    notifier.resetRegistration();

    final state = container.read(registerViewModelProvider);
    expect(state.firstName, '');
    expect(state.phone, '');
    expect(state.verificationId, '');
    expect(state.destinationMasked, '');
  });
}
