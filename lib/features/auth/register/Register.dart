import 'package:evently/core/resources/Assets_Manger.dart';
import 'package:evently/core/widgets/clickable_button.dart';
import 'package:evently/core/widgets/clickable_text.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Register")),
      ),
      body: Container(
        margin: REdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(AssetsManger.evently_logo, height: 186.h, width: 136.w),
            SizedBox(height: 24.h),
            CustomTextField(
                prefixIconType: Icons.person_2_rounded, labelText: "Name"),
            SizedBox(height: 16.h),
            CustomTextField(
                prefixIconType: Icons.email_rounded, labelText: "Email"),
            SizedBox(height: 16.h),
            CustomTextField(
              prefixIconType: Icons.lock,
              labelText: "Password",
              suffixIconType: Icons.visibility_off_rounded,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              prefixIconType: Icons.lock,
              labelText: "Re Password",
              suffixIconType: Icons.visibility_off_rounded,
            ),
            SizedBox(height: 16.h),
            ClickableButton(),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(width: 8.w),
                ClickableText(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
