import 'package:flutter/material.dart';

class ConfirmPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const ConfirmPasswordTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    required this.validator,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfirmPasswordTextFormFieldState();
}

class _ConfirmPasswordTextFormFieldState
    extends State<ConfirmPasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autocorrect: false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: _obscureText,
    );
  }
}
