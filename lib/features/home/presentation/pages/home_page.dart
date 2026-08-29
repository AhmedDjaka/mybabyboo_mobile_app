import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/home_header.dart';
import '../widgets/pregnancy_overview_card.dart';
import '../widgets/pregnancy_not_dated_card.dart';
import '../widgets/baby_this_week_card.dart';
import '../widgets/daily_mama_card.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/next_appointment_card.dart';
import '../state/home_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../profile/presentation/viewmodels/profile_photo_viewmodel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F8), // AppColors.background
      body: SafeArea(
        child: state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(color: Color(0xFFF08EA2)),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: Color(0xFFF08EA2)),
          ),
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    color: Color(0xFFF08EA2),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(homeViewModelProvider.notifier).loadHomeData(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF08EA2),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Réessayer'),
                ),
              ],
            ),
          ),
          loaded: (summary) {
            final isDated = summary.pregnancy?.pregnancyDated ?? false;

            return RefreshIndicator(
              color: const Color(0xFFF08EA2),
              onRefresh: () =>
                  ref.read(homeViewModelProvider.notifier).refresh(),
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 32,
                  bottom: 100, // Extra padding for bottom navigation
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  HomeHeader(
                    displayName: summary.user.displayName,
                    profilePhotoUrl: summary.user.profilePhotoUrl,
                    isUploading: ref
                        .watch(profilePhotoViewModelProvider)
                        .isLoading,
                    onAvatarUpload: () async {
                      debugPrint('[PROFILE PHOTO] picker opening');
                      final picker = ImagePicker();
                      final image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      debugPrint(
                        '[PROFILE PHOTO] picker returned = ${image != null ? 'yes' : 'no'}',
                      );
                      if (image != null) {
                        debugPrint('[PROFILE PHOTO] upload started');
                        ref
                            .read(profilePhotoViewModelProvider.notifier)
                            .uploadPhoto(image.path);
                      }
                    },
                    onAvatarDelete: () {
                      ref
                          .read(profilePhotoViewModelProvider.notifier)
                          .deletePhoto();
                    },
                  ),
                  const SizedBox(height: 24),

                  if (isDated && summary.pregnancy != null)
                    PregnancyOverviewCard(pregnancy: summary.pregnancy!)
                  else
                    const PregnancyNotDatedCard(),

                  const SizedBox(height: 24),

                  if (isDated) ...[
                    BabyThisWeekCard(babyContent: summary.babyThisWeek),
                    const SizedBox(height: 24),
                  ],

                  DailyMamaCard(dailyMessage: summary.dailyMessage),

                  const SizedBox(height: 24),
                  const QuickActionsSection(),

                  const SizedBox(height: 24),
                  NextAppointmentCard(appointment: summary.nextAppointment),

                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
