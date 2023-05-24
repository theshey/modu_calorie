import 'package:flutter/material.dart';
import 'package:modu_calorie/pages/entry_page.dart';
import 'package:modu_calorie/pages/sign_in_page.dart';
import 'package:modu_calorie/pages/sign_up_page.dart';
import 'package:modu_calorie/pages/signed_up_page.dart';
import 'package:modu_calorie/theme/modu_calorie_theme.dart';
import 'pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ModuCalorieTheme.getThemeData(),
      // navigator
      initialRoute: 'EntryPage',
      routes: {
        'EntryPage': (context) => const EntryPage(),
        'SignInPage': (context) => const SignInPage(),
        'SignUpPage': (context) => const SignUpPage(),
        'SignedUpPage': (context) => const SignedUpPage(),
        'MainPage': (context) => const MainPage(),
      },
    );
  }
}
