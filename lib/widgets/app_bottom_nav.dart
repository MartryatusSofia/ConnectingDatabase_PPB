import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    this.onTabChanged,
  });

  final int currentIndex;
  final ValueChanged<int>? onTabChanged;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2563EB);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary,
      unselectedItemColor: const Color(0xFF9CA3AF),
      showUnselectedLabels: true,
      onTap: (index) {
        // Hindari reload ke halaman yang sama
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            break;
          case 1:
            Navigator.pushNamedAndRemoveUntil(context, '/saved-jobs', (route) => false);
            break;
          case 2:
            Navigator.pushNamedAndRemoveUntil(context, '/status-lamaran', (route) => false);
            break;
          case 3:
            Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Simpan'),
        BottomNavigationBarItem(icon: Icon(Icons.donut_large_outlined), label: 'Status'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Akun'),
      ],
    );
  }
}
