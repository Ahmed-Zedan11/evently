import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickableButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color color;

  const ClickableButton(
      {super.key,
      required this.text,
      required this.onClick,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
          height: 56.h,
          width: 361.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.inter(
                  color: ColorsManger.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
