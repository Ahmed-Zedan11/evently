import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final IconData? prefixIconType;
  final Widget? suffixIconType;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool isSecure;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final int lines;
  final String? hintText;

  const CustomTextField(
      {super.key,
      this.prefixIconType,
      this.labelText,
      this.suffixIconType,
      this.keyboardType,
      this.isSecure = false,
      required this.validator,
      required this.controller,
      this.lines = 1,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: ColorsManger.black),
        maxLines: lines,
        controller: controller,
        validator: validator,
        obscureText: isSecure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          errorMaxLines: 3,
          prefixIcon: Icon(
            prefixIconType,
            size: 24.sp,
          ),
          labelText: labelText,
          suffixIcon: suffixIconType,
        ));
  }
}
