class OnboardingSlideData {
  const OnboardingSlideData({
    required this.id,
    required this.title,
    this.description,
    this.items,
    required this.illustrationAsset,
    this.accentType,
  });

  final String id;
  final String title;
  final String? description;
  final List<String>? items;
  final String illustrationAsset;
  final String? accentType;
}

const List<OnboardingSlideData> onboardingSlides = [
  OnboardingSlideData(
    id: 'slide_01',
    title: 'Suivez votre grossesse\nsemaine après semaine.',
    description: 'Découvrez comment votre\nbébé grandit et évolue.',
    illustrationAsset: 'assets/illustrations/onboarding/onboarding_baby.png',
  ),
  OnboardingSlideData(
    id: 'slide_02',
    title: 'Prenez soin de vous',
    items: [
      'Conseils personnalisés',
      'Nutrition',
      'Bien-être',
      'Santé & symptômes',
      'Suivi de poids',
    ],
    illustrationAsset:
        'assets/illustrations/onboarding/onboarding_wellbeing.png',
  ),
  OnboardingSlideData(
    id: 'slide_03',
    title: 'N\'oubliez rien\nd\'important',
    items: [
      'Rendez-vous',
      'Échographies',
      'Analyses',
      'Médicaments',
      'Rappels',
    ],
    illustrationAsset:
        'assets/illustrations/onboarding/onboarding_reminders.png',
  ),
  OnboardingSlideData(
    id: 'slide_04',
    title: 'Gardez vos\nsouvenirs précieux',
    items: [
      'Photos',
      'Émotions',
      'Moments',
      'Échographies',
      'Notes & journal',
      'Voice Life',
    ],
    illustrationAsset:
        'assets/illustrations/onboarding/onboarding_memories.png',
  ),
];
