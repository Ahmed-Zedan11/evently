import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIconType;
  final Widget? suffixIconType;
  final String labelText;
  final TextInputType? keyboardType;
  final bool isSecure;
  final String? Function(String?) validator;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.prefixIconType,
      required this.labelText,
      this.suffixIconType,
      this.keyboardType,
      this.isSecure = false,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isSecure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorMaxLines: 3,
          prefixIcon: Icon(
            prefixIconType,
            size: 24.sp,
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: suffixIconType,
        ));
  }
}
