import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickableButton extends StatelessWidget {
  const ClickableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      height: 56.h,
      width: 361.w,
      decoration: BoxDecoration(
        color: ColorsManger.blue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          "Create Account",
          style: GoogleFonts.inter(
              color: ColorsManger.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    ));
  }
}
