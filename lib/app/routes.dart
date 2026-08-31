import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/auth_welcome_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/auth/presentation/pages/reset_password_page.dart';
import '../features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../features/auth/domain/entities/auth_session.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/pregnancy/presentation/pages/pregnancy_page.dart';
import '../features/appointments/presentation/pages/appointments_page.dart';
import '../features/universe/presentation/pages/universe_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/profile/presentation/pages/profile_setup_page.dart';
import '../features/pregnancy/presentation/pages/pregnancy_setup_page.dart';
import '../features/pregnancy/presentation/pages/pregnancy_tips_page.dart';
import '../features/design_system/presentation/pages/design_system_preview_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../shared/navigation/main_layout.dart';
import '../dev/dev_lottie_test_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellHome',
);
final _shellNavigatorAgendaKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellAgenda',
);
final _shellNavigatorPregnancyKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellPregnancy',
);
final _shellNavigatorUniversKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellUnivers',
);
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellProfile',
);

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  RouterNotifier(this.ref) {
    ref.listen<AsyncValue<AuthSession?>>(authViewModelProvider, (
      previous,
      next,
    ) {
      notifyListeners();
    });
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/pregnancy/tips',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authViewModelProvider);
      
      // Allow Splash/Onboarding to run.
      if (state.matchedLocation == '/splash' || state.matchedLocation == '/onboarding') {
        return null;
      }

      // If we are still loading, wait.
      if (authState.isLoading) return null;

      final isAuthRoute = state.matchedLocation.startsWith('/auth');
      final isAuthenticated = authState.value != null;

      if (!isAuthenticated && !isAuthRoute) {
        return '/auth/login';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/dev/design-system',
        builder: (context, state) => const DesignSystemPreviewPage(),
      ),
      if (kDebugMode)
        GoRoute(
          path: '/dev/lottie-test',
          builder: (context, state) => const DevLottieTestPage(),
        ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthWelcomePage(),
        routes: [
          GoRoute(
            path: 'register',
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: 'forgot-password',
            builder: (context, state) => const ForgotPasswordPage(),
          ),
          GoRoute(
            path: 'reset-password',
            builder: (context, state) {
              final phone = state.extra as String? ?? '';
              return ResetPasswordPage(phone: phone);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/profile-setup',
        builder: (context, state) => const ProfileSetupPage(),
      ),
      GoRoute(
        path: '/pregnancy-setup',
        builder: (context, state) => const PregnancySetupPage(),
      ),
      GoRoute(
        path: '/pregnancy-edit',
        builder: (context, state) => const PregnancySetupPage(isEditMode: true),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAgendaKey,
            routes: [
              GoRoute(
                path: '/agenda',
                builder: (context, state) => const AppointmentsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPregnancyKey,
            routes: [
              GoRoute(
                path: '/pregnancy',
                builder: (context, state) => const PregnancyPage(),
                routes: [
                  GoRoute(
                    path: 'tips',
                    builder: (context, state) {
                      final week = state.extra as int?;
                      return PregnancyTipsPage(weekContext: week);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorUniversKey,
            routes: [
              GoRoute(
                path: '/univers',
                builder: (context, state) => const UniversePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
