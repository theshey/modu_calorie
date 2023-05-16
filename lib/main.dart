import 'package:flutter/material.dart';
import 'package:modu_calorie/entry_pages/entry_page.dart';
import 'package:modu_calorie/entry_pages/login_page.dart';
import 'package:modu_calorie/entry_pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
