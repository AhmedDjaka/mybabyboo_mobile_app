import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import 'package:baby_mama/features/auth/domain/entities/auth_user.dart';
import 'package:baby_mama/features/auth/domain/repositories/auth_repository.dart';
import 'package:baby_mama/features/auth/domain/entities/auth_session.dart';
import 'package:baby_mama/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'package:baby_mama/features/profile/domain/entities/user_profile.dart';
import 'package:baby_mama/features/profile/domain/repositories/profile_repository.dart';
import 'package:baby_mama/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:baby_mama/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:baby_mama/features/profile/presentation/pages/profile_setup_page.dart';
import 'package:baby_mama/core/accessibility/voice_preferences_provider.dart';
import 'package:baby_mama/core/audio/tts_service.dart';
import 'package:baby_mama/features/profile/domain/repositories/reference_repository.dart';
import 'package:baby_mama/features/profile/data/repositories/reference_repository_impl.dart';
import 'package:baby_mama/features/profile/domain/entities/country.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockReferenceRepository extends Mock implements ReferenceRepository {}

class _FakeAuthViewModel extends AuthViewModel {
  final AsyncValue<AuthSession?> _initialState;
  _FakeAuthViewModel(this._initialState);

  @override
  AsyncValue<AuthSession?> build() => _initialState;
}

Widget _buildTestableApp({
  required Widget home,
  List<Override> overrides = const [],
}) {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => home),
      GoRoute(
        path: '/pregnancy-setup',
        builder: (context, state) =>
            const Scaffold(body: Text('Pregnancy Setup')),
      ),
    ],
  );

  return ProviderScope(
    overrides: overrides,
    child: MaterialApp.router(routerConfig: router),
  );
}

void main() {
  late MockAuthRepository mockAuthRepo;
  late MockProfileRepository mockProfileRepo;
  late MockReferenceRepository mockReferenceRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepository();
    mockProfileRepo = MockProfileRepository();
    mockReferenceRepo = MockReferenceRepository();

    when(() => mockReferenceRepo.getCountries()).thenAnswer(
      (_) async => [const Country(isoCode: 'CI', name: 'Côte d\'Ivoire')],
    );
  });

  // ─── AuthUser pre-fill ────────────────────────────────────────────────────

  testWidgets('Prérempli le displayName avec le prénom de AuthUser', (
    tester,
  ) async {
    when(
      () => mockAuthRepo.checkProfileCompleted(),
    ).thenAnswer((_) async => false);

    const authUser = AuthUser(
      id: 1,
      name: 'Koné Aïcha',
      firstName: 'Aïcha',
      lastName: 'Koné',
      phone: '+225070',
    );

    const authSession = AuthSession(
      user: authUser,
      profileCompleted: false,
      pregnancyConfigured: false,
    );

    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authViewModelProvider.overrideWith(
            () => _FakeAuthViewModel(const AsyncValue.data(authSession)),
          ),
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aïcha'), findsOneWidget);
  });

  // ─── Step 1 validation ────────────────────────────────────────────────────

  testWidgets('Le bouton Continuer est désactivé si displayName est vide', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    // Le champ est vide → bouton désactivé
    final continuerButton = find.widgetWithText(ElevatedButton, 'Continuer');
    expect(tester.widget<ElevatedButton>(continuerButton).onPressed, isNull);
  });

  testWidgets('Navigation vers étape 2 après saisie du prénom', (tester) async {
    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Aïcha');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();

    expect(find.text('Quelques préférences\npour vous'), findsOneWidget);
  });

  // ─── Birth date ───────────────────────────────────────────────────────────

  testWidgets('La date de naissance est facultative', (tester) async {
    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    // Saisir un nom et naviguer sans date
    await tester.enterText(find.byType(TextFormField).first, 'Aïcha');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();

    // On est à l'étape 2 — aucune erreur de validation
    expect(find.text('Quelques préférences\npour vous'), findsOneWidget);
  });

  // ─── Step 2 ───────────────────────────────────────────────────────────────

  testWidgets('Retour étape 2 → étape 1 conserve le prénom', (tester) async {
    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Fatou');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();

    // Retour étape 1
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    // Le prénom est toujours là
    final ctrl = tester.widget<TextFormField>(find.byType(TextFormField).first);
    expect(ctrl.controller?.text, 'Fatou');
  });

  testWidgets('La ville est facultative (étape 2)', (tester) async {
    when(
      () => mockProfileRepo.updateProfile(
        displayName: any(named: 'displayName'),
        birthDate: any(named: 'birthDate'),
        countryCode: any(named: 'countryCode'),
        city: any(named: 'city'),
        locale: any(named: 'locale'),
        voiceAssistanceEnabled: any(named: 'voiceAssistanceEnabled'),
      ),
    ).thenAnswer(
      (_) async => const UserProfile(
        id: 1,
        userId: 1,
        displayName: 'Aïcha',
        countryCode: 'CI',
        locale: 'fr',
        profileCompleted: true,
      ),
    );

    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    // Étape 1
    await tester.enterText(find.byType(TextFormField).first, 'Aïcha');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();

    // Étape 2 — soumettre sans remplir la ville
    await tester.tap(find.text('Terminer'));
    await tester.pumpAndSettle();

    verify(
      () => mockProfileRepo.updateProfile(
        displayName: 'Aïcha',
        birthDate: null,
        countryCode: 'CI',
        city: null,
        locale: 'fr',
        voiceAssistanceEnabled: false,
      ),
    ).called(1);
  });

  // ─── Submit ───────────────────────────────────────────────────────────────

  // Test removed because navigation is now handled by GoRouter's refreshListenable

  testWidgets('Erreur API affiche un message', (tester) async {
    when(
      () => mockProfileRepo.updateProfile(
        displayName: any(named: 'displayName'),
        birthDate: any(named: 'birthDate'),
        countryCode: any(named: 'countryCode'),
        city: any(named: 'city'),
        locale: any(named: 'locale'),
        voiceAssistanceEnabled: any(named: 'voiceAssistanceEnabled'),
      ),
    ).thenThrow(Exception('Erreur serveur'));

    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
        ],
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Aïcha');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Terminer'));
    await tester.pumpAndSettle();

    expect(
      find.text('Une erreur est survenue. Veuillez réessayer.'),
      findsOneWidget,
    );
  });
  // ─── TTS Focus Tests ──────────────────────────────────────────────────────

  testWidgets('Focus sur le prénom déclenche le TTS si activé', (tester) async {
    final mockTts = _MockTtsService();
    when(() => mockTts.speak(any())).thenAnswer((_) async {});

    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
          voicePreferencesProvider.overrideWith(() => _FakeVoiceNotifier()),
          ttsServiceProvider.overrideWithValue(mockTts),
        ],
      ),
    );
    await tester.pumpAndSettle();

    // Focus sur le champ Prénom
    await tester.tap(find.byType(TextFormField).first);
    await tester.pump();

    verify(
      () => mockTts.speak(
        "Indiquez le prénom que vous souhaitez voir affiché dans MyBabyBoo.",
      ),
    ).called(1);
  });

  testWidgets('Focus sur la date de naissance déclenche le TTS si activé', (
    tester,
  ) async {
    final mockTts = _MockTtsService();
    when(() => mockTts.speak(any())).thenAnswer((_) async {});

    await tester.pumpWidget(
      _buildTestableApp(
        home: const ProfileSetupPage(),
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepo),
          profileRepositoryProvider.overrideWithValue(mockProfileRepo),
          referenceRepositoryProvider.overrideWithValue(mockReferenceRepo),
          voicePreferencesProvider.overrideWith(() => _FakeVoiceNotifier()),
          ttsServiceProvider.overrideWithValue(mockTts),
        ],
      ),
    );
    await tester.pumpAndSettle();

    // Focus sur le premier champ (JJ) du composant BirthDate
    await tester.tap(find.widgetWithText(TextField, 'JJ'));
    await tester.pump();

    verify(
      () => mockTts.speak(
        "Indiquez votre date de naissance. Cette information est facultative. Saisissez le jour, le mois et l'année, ou utilisez le calendrier.",
      ),
    ).called(1);
  });
}

class _MockTtsService extends Mock implements TtsService {}

class _FakeVoiceNotifier extends AsyncNotifier<bool>
    implements VoicePreferencesNotifier {
  @override
  Future<bool> build() async => true;

  @override
  Future<void> setEnabled(bool value) async {}
}
