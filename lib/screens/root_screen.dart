import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/res/constants/app_color.dart';
import 'package:show_time/screens/home_screen.dart';

import 'search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  // List of screens for each tab in the BottomNavigationBar
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),

  ];

  // Function to update the selected index when a tab is tapped
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],  // Display the current screen
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: AppColors.backgroundBlack,
          
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ]),
        child: bottomNavBar(),
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: AppColors.backgroundBlack,
      currentIndex: _currentIndex,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.darkGray,
      onTap: _onTabTapped,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon:  Icon(Icons.search_rounded),
            label: 'Search'
        ),

      ],
    );
  }
}