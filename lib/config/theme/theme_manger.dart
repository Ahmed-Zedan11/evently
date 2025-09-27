import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManger {
  static final ThemeData light = ThemeData(
      bottomAppBarTheme: BottomAppBarTheme(
        color: ColorsManger.blue,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        headlineSmall: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManger.blue),
        headlineMedium: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManger.black),
        bodySmall: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManger.black,
        ),
        bodyMedium: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManger.black),
        displaySmall: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManger.blue),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorsManger.blue,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManger.white,
        foregroundColor: ColorsManger.blue,
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManger.blue),
      ),
      scaffoldBackgroundColor: ColorsManger.white,
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: ColorsManger.grey,
          suffixIconColor: ColorsManger.grey,
          labelStyle: TextStyle(
            color: ColorsManger.grey,
          ),
          floatingLabelStyle: TextStyle(
            color: ColorsManger.blue,
          ),
          errorStyle: TextStyle(
            color: ColorsManger.red,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.grey),
              borderRadius: BorderRadius.all(Radius.circular(16.r))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.blue),
              borderRadius: BorderRadius.all(Radius.circular(16.r))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.red),
              borderRadius: BorderRadius.all(Radius.circular(16.r))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.red),
              borderRadius: BorderRadius.all(Radius.circular(16.r)))));

  static final ThemeData dark = ThemeData();
}
