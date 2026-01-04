import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/colors.dart';
import 'bottom_nav_provider.dart';
import 'pages/home/home_page.dart';
import 'pages/booking/booking_page.dart';
import 'pages/category/category_page.dart';
import 'pages/chat/chat_page.dart';
import 'pages/profile/profile_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    final pages = const [
      HomePage(),
      BookingPage(),
      CategoryPage(),
      ChatPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.background, // #F6F7F9
          boxShadow: [
            BoxShadow(
              color: const Color(0x331E1C1C),
              blurRadius: 100,
              offset: const Offset(-30, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => ref.read(bottomNavProvider.notifier).state = index,

          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,

          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,

          showSelectedLabels: false, 
          showUnselectedLabels: false, 

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number_outlined),
              label: 'Tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: 'Grid',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
