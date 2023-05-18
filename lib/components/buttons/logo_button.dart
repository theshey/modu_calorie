import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  Function()? onPressed;
  String imagePath;
  Color? color;

  LogoButton({
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
        padding: const EdgeInsets.all(5.0),
        backgroundColor: color,
        elevation: 0.0,
        fixedSize: const Size.fromHeight(30.0),
        minimumSize: const Size.fromHeight(30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: Image.asset(imagePath),
    );
  }
}
