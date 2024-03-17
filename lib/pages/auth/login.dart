// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/auth/_login_manager.dart';
import 'package:fl_audio_book/pages/profile/languages.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/extension.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController mobileController = TextEditingController();
  DateTime? backPressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop(context);
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              loginDetailBox(size, context),
              logoBox(size),
            ],
          ),
        ),
      ),
    );
  }

  loginDetailBox(Size size, BuildContext context) {
    return Positioned(
      top: size.height * 0.2,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color(0xFFF3F0F0),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(160),
          ),
        ),
        child: Column(
          children: [
            heightBox(size.height * 0.11),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  loginText(context),
                  heightSpace,
                  heightSpace,
                  mobileNumberTitle(context),
                  heightSpace,
                  phoneField(context),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  loginButton(size, context),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  orText(context),
                  heightSpace,
                  heightSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //register
  loginButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        var mobileNumber = mobileController.text;
        if (mobileNumber.isNullOrEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter mobile number'),
            ),
          );
        } else {
          LoginManager.createUser(mobileNumber, "");
          Navigator.pushNamed(context, '/otp');
        }
      },
      child: Container(
        height: size.height * 0.07,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.2),
              blurRadius: 24,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'login.login'),
          style: bold18White,
        ),
      ),
    );
  }

  orText(context) {
    return Row(
      children: [
        dottedBorder(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(getTranslate(context, 'Register'))),
          ),
        ),
        dottedBorder(),
      ],
    );
  }

  dottedBorder() {
    return Expanded(
      child: DottedBorder(
        padding: EdgeInsets.zero,
        color: greyB4Color,
        dashPattern: const [2, 5],
        child: Container(),
      ),
    );
  }

  loginText(context) {
    return Center(
      child: Text(
        getTranslate(context, 'login.login_text'),
        style: bold28Black2,
      ),
    );
  }

  mobileNumberTitle(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'login.number'),
        style: bold17Black2,
      ),
    );
  }

  phoneField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 6,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: IntlPhoneField(
          textAlign:
              selectedLanguagesIndex == 4 ? TextAlign.right : TextAlign.left,
          controller: mobileController,
          keyboardType: TextInputType.phone,
          dropdownTextStyle: bold16Black2,
          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: blackColor2,
          ),
          initialCountryCode: 'IN',
          disableLengthCheck: true,
          showCountryFlag: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslate(context, 'login.enter_number'),
            hintStyle: semibold16Grey94,
          ),
        ),
      ),
    );
  }

  logoBox(Size size) {
    return Positioned(
      left: 0,
      right: 0,
      top: size.height * 0.1,
      child: Container(
        height: size.height * 0.2,
        width: size.height * 0.2,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFCD9C1),
        ),
        child: Center(
          child: Image.asset(
            "assets/icon.png",
            height: size.height * 0.1,
            width: size.height * 0.1,
          ),
        ),
      ),
    );
  }

  onWillPop(context) {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) >= const Duration(seconds: 2)) {
      backPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blackColor,
          content: Text(
            getTranslate(context, 'exit_app.app_exit'),
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
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
