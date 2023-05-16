import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const PasswordTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autocorrect: false,
      validator: widget.validator,
      onSaved: widget.onSaved,
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
