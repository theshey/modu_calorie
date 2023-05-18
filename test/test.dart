import 'package:flutter/material.dart';
import 'package:modu_calorie/main_pages/main_page.dart';
import 'package:modu_calorie/theme/modu_calorie_theme.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ModuCalorieTheme.getThemeData(),
      home: MainPage(),
    );
  }
}
