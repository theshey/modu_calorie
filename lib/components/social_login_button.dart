import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  Function()? onPressed;
  String imagePath;
  Color? color;

  SocialLoginButton({
    super.key,
    this.onPressed,
    required this.imagePath,
    this.color,
  });

  @override
  ElevatedButton build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(7.0),
        fixedSize: const Size.fromHeight(36.0),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Image.asset(imagePath),
    );
  }
}
