import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      style: TextStyle(
        color: Colors.white,
      ),
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: hintText ?? 'Type.....',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
