import 'package:flutter/material.dart';

class UsernameTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;

  const UsernameTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
  }) : super(key: key);

  @override
  _UsernameTextFormFieldState createState() => _UsernameTextFormFieldState();
}

class _UsernameTextFormFieldState extends State<UsernameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}