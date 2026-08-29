import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  /// Builds a [NavigationDestination] where the icon can be either a Material
  /// [IconData] or a custom SVG asset.
  static NavigationDestination _destination({
    required String label,
    required Widget inactiveIcon,
    required Widget activeIcon,
  }) {
    return NavigationDestination(
      icon: inactiveIcon,
      selectedIcon: activeIcon,
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFFF08EA2);
    const Color inactiveColor = Color(0xFF806A78);
    const double iconSize = 28; // Increased from 26 for better presence

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: [
          // Accueil
          _destination(
            label: 'Accueil',
            inactiveIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/home.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(
                inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/home.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(activeColor, BlendMode.srcIn),
            ),
          ),
          // Agenda
          _destination(
            label: 'Agenda',
            inactiveIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/agenda.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(
                inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/agenda.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(activeColor, BlendMode.srcIn),
            ),
          ),
          // Grossesse
          _destination(
            label: 'Grossesse',
            inactiveIcon: Transform.translate(
              offset: const Offset(0, -8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6F8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5D7A).withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/home/bottom_nav/pregnancy.svg',
                  width: iconSize,
                  height: iconSize,
                  colorFilter: const ColorFilter.mode(
                    inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            activeIcon: Transform.translate(
              offset: const Offset(0, -8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAD6E1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5D7A).withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/home/bottom_nav/pregnancy.svg',
                  width: iconSize,
                  height: iconSize,
                  colorFilter: const ColorFilter.mode(
                    activeColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          // Mon Univers
          _destination(
            label: 'Mon Univers',
            inactiveIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/universe.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(
                inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/universe.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(activeColor, BlendMode.srcIn),
            ),
          ),
          // Profil
          _destination(
            label: 'Profil',
            inactiveIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/profile.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(
                inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home/bottom_nav/profile.svg',
              width: iconSize,
              height: iconSize,
              colorFilter: const ColorFilter.mode(activeColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
