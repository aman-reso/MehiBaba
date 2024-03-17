import 'dart:ffi';

import 'package:fl_audio_book/localization/localizations.dart';
import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/bhajans/complete_bhajan_screen.dart';
import 'package:fl_audio_book/pages/category/complete_category_screen.dart';
import 'package:fl_audio_book/pages/ebooks/ebooks.dart';
import 'package:fl_audio_book/pages/form/upcoming_satsang_form.dart';
import 'package:fl_audio_book/pages/home/model/home_page_response_model.dart';
import 'package:fl_audio_book/pages/screens.dart';
import 'package:fl_audio_book/pdf/open_pdf.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/video/YoutubePlayerDemoApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MehiBaba',
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/ytPlayer':
            final String? youtubeUrl = settings.arguments as String?;
            return PageTransition(
              child: YoutubePlayerDemoApp(youtubeUrl: youtubeUrl),
              type: PageTransitionType.rightToLeft,
            );
            return PageTransition(
              child: const YoutubePlayerDemoApp(),
              type: PageTransitionType.rightToLeft,
            );
          case '/':
            return PageTransition(
              child: const SplashScreen(),
              type: PageTransitionType.fade,
            );
          case '/onboarding':
            return PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.fade,
            );
          case '/login':
            return PageTransition(
              child: LoginScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/register':
            return PageTransition(
              child: const RegisterScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/otp':
            return PageTransition(
              child: const OTPVerification(),
              type: PageTransitionType.rightToLeft,
            );
          case '/bottomNavigation':
            return PageTransition(
              child: const BottomNavigationScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/home':
            return PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/notification':
            return PageTransition(
              child: const NotificationScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/getPremium':
            return PageTransition(
              child: const GetPremiumScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/payment':
            return PageTransition(
              child: const PaymentScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/success':
            return PageTransition(
              child: const SuccessScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/mostpopular':
            return PageTransition(
              child: const CompleteBhajansScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/storyDetail':
            var ebook = settings.arguments as Ebook?;
            return PageTransition(
              child: PDFScreen(ebook),
              type: PageTransitionType.rightToLeft,
            );

          case '/review':
            return PageTransition(
              child: ReviewScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/reading':
            Ebook? ebook = settings.arguments as Ebook?;
            return PageTransition(
              child: ReadingScreen(ebook),
              type: PageTransitionType.rightToLeft,
            );
          case '/audioscreen':
            var bhajan = settings.arguments as Bhajan?;
            return PageTransition(
              child: AudioScreen(bhajan),
              type: PageTransitionType.rightToLeft,
            );
          case '/recommended':
            return PageTransition(
              child: const EbookListScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/newRelease':
            return PageTransition(
              child: const NewReleaseScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/paidstory':
            return PageTransition(
              child: PaidStoryScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/famousAuthor':
            return PageTransition(
              child: const CompleteCategoryScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/authorScreen':
            return PageTransition(
              child: const AuthorScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/search':
            return PageTransition(
              child: const Search(),
              type: PageTransitionType.rightToLeft,
            );
          case '/searchScreen':
            return PageTransition(
              child: const SearchScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/horror':
            return PageTransition(
              child: HorrorScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/myBook':
            return PageTransition(
              child: const MyBookScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/profile':
            return PageTransition(
              child: const ProfileScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/editProfile':
            return PageTransition(
              child: const EditProfileScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/download':
            return PageTransition(
              child: const DownloadScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/languages':
            return PageTransition(
              child: const LanguagesScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/followlist':
            return PageTransition(
              child: const FollowListScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/appSettings':
            return PageTransition(
              child: const AppSettings(),
              type: PageTransitionType.rightToLeft,
            );
          case '/termsAndCondition':
            return PageTransition(
              child: const TermsAndConditionScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/privacyPolicy':
            return PageTransition(
              child: const PrivacyPolicyScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/helpAndSupport':
            return PageTransition(
              child: const HelpAndSupportScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/bookSatsang':
              return PageTransition(
                child: const UpComingSatsangForm(),
                type: PageTransitionType.rightToLeft,
              );
          default:
            return null;
        }
      },
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('id'),
        Locale('zh'),
        Locale('ar'),
      ],
      localizationsDelegates: [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale?.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
