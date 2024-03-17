import 'dart:async';

import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'auth/auth_token_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      AuthTokenManager.getAuthToken().then((authToken) {
        if (authToken != null) {
          if (kDebugMode) {
            print('Authentication token: $authToken');
          }
          Navigator.pushNamed(context, '/bottomNavigation');
        } else {
          if (kDebugMode) {
            print('No authentication token found.');
          }
          Navigator.pushNamed(context, '/login');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('Error retrieving authentication token: $error');
        }
        Navigator.pushNamed(context, '/login');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: size.height,
            width: double.maxFinite,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon.png",
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                  heightSpace,
                  const Text(
                    "The Inward Journey of the Soul",
                    style: extrabold16White,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
