import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Text(
      "Login",
      style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManger.blue,
          decoration: TextDecoration.underline,
          decorationColor: ColorsManger.blue),
    ));
  }
}
