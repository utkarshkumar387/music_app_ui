import 'package:flutter/material.dart';

import '../core/resources/assets/assets.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xB2171E26).withOpacity(0.8),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                Assets.homeFillIcon,
              ),
              size: 28,
            ),
            activeIcon: ImageIcon(
              AssetImage(Assets.homeFillIcon),
              size: 28,
              color: Colors.white,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Assets.searchIcon),
              size: 28,
              color: Color(0xff76878F),
            ),
            activeIcon: ImageIcon(
              AssetImage(Assets.searchIcon),
              size: 28,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.createButtonIcon,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            activeIcon: Image.asset(
              Assets.createButtonIcon,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(Assets.usersIcon),
              size: 28,
              color: Color(0xff76878F),
            ),
            activeIcon: ImageIcon(
              AssetImage(Assets.usersIcon),
              size: 28,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.avatarIcon,
              height: 30,
            ),
            activeIcon: Image.asset(
              Assets.avatarIcon,
              height: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
