class ApiEndpoints {
  // Auth
  static const String authLogin = '/api/v1/auth/login';
  static const String authMe = '/api/v1/auth/me';
  static const String authRegistrationStart = '/api/v1/auth/registration/start';
  static const String authRegistrationVerify =
      '/api/v1/auth/registration/verify';
  static const String authRegistrationResend =
      '/api/v1/auth/registration/resend';
  static const String authRegistrationComplete =
      '/api/v1/auth/registration/complete';
  static const String authPasswordForgot = '/api/v1/auth/password/forgot';
  static const String authPasswordVerify = '/api/v1/auth/password/verify';
  static const String authPasswordReset = '/api/v1/auth/password/reset';

  // Pregnancy
  static const String pregnancySetup = '/api/v1/pregnancy/setup';
  static const String pregnancyCurrent = '/api/v1/pregnancy/current';
  static const String pregnancyWeeks = '/api/v1/pregnancy/weeks';

  // Reference
  static const String referenceCountries = '/api/v1/reference/countries';
  static const String referenceCities = '/api/v1/reference/cities';
}
