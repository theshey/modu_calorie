import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;

  const AppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: FittedBox(
          fit: BoxFit.none,
          child: IconButton(
            onPressed: onPressed,
            iconSize: 26.0,
            icon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
