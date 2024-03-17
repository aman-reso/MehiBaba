import 'dart:io';
import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/category/complete_category_screen.dart';
import 'package:fl_audio_book/pages/screens.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  DateTime? backpressTime;

  final pages = [
    const HomeScreen(),
    const CompleteCategoryScreen(),
    const NewReleaseScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onwillPop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: pages.elementAt(currentIndex),
        bottomNavigationBar: bottomNavigation(),
      ),
    );
  }

  bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      backgroundColor: whiteColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyB4Color,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: bold14Primary,
      unselectedLabelStyle: bold14Primary,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: getTranslate(context, 'Home'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.category),
          label: getTranslate(context, 'Explore'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.play_lesson_rounded),
          label: getTranslate(context, 'New Release'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline_rounded),
          label: getTranslate(context, 'Profile'),
        )
      ],
    );
  }

  onwillPop() {
    DateTime now = DateTime.now();
    if (backpressTime == null ||
        now.difference(backpressTime!) >= const Duration(seconds: 2)) {
      backpressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blackColor,
          content: Text(
            getTranslate(context, 'exit_app.app_exit'),
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
