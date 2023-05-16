import 'package:flutter/material.dart';
import 'package:modu_calorie/login_pages/entry_page.dart';
import 'package:modu_calorie/login_pages/login_page.dart';
import 'login_pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignUpPage(),
      ),
    );
  }
}
