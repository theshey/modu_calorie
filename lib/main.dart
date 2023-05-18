import 'package:flutter/material.dart';
import 'package:modu_calorie/entry_pages/entry_page.dart';
import 'package:modu_calorie/entry_pages/sign_in_page.dart';
import 'package:modu_calorie/entry_pages/sign_up_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:modu_calorie/entry_pages/signed_up_page.dart';
import 'package:modu_calorie/theme/modu_calorie_theme.dart';
import 'firebase_options.dart';
import 'main_pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
