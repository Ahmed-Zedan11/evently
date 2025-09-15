import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({super.key, required this.title, required this.onClick});

  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: Text(
          title,
          style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManger.blue,
              decoration: TextDecoration.underline,
              decorationColor: ColorsManger.blue),
        ));
  }
}
