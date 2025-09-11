import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIconType;
  final IconData? suffixIconType;
  final String labelText;

  const CustomTextField(
      {super.key,
      required this.prefixIconType,
      required this.labelText,
      this.suffixIconType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIconType,
              size: 24.sp,
            ),
            labelText: labelText,
            labelStyle: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: Icon(suffixIconType, size: 24.sp)));
  }
}
