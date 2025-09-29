import 'package:evently/core/resources/Assets_Manger.dart';
import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/validator.dart';
import 'package:evently/core/routes_manger/Routes_Manger.dart';
import 'package:evently/core/widgets/clickable_button.dart';
import 'package:evently/core/widgets/clickable_text.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool securedPassword = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: REdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(AssetsManger.eventlyLogo,
                      width: 186.w, height: 136.h),
                  CustomTextField(
                    prefixIconType: Icons.email_rounded,
                    labelText: 'Email',
                    validator: Validator.validateEmail,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _passwordController,
                    validator: Validator.validatePassword,
                    isSecure: securedPassword,
                    prefixIconType: Icons.lock,
                    labelText: "Password",
                    suffixIconType: IconButton(
                        onPressed: () {
                          securedPassword = !securedPassword;
                          setState(() {});
                        },
                        icon: Icon(securedPassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded)),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Spacer(),
                      ClickableText(title: 'Forget Password?', onClick: () {}),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ClickableButton(
                    text: "login",
                    onClick: _login,
                    color: ColorsManger.blue,
                  ),
                  SizedBox(height: 24.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Don't have Account?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(width: 8.w),
                    ClickableText(
                        title: "Create Account", onClick: _createAccount)
                  ]),
                  SizedBox(height: 24.h),
                  Row(children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        indent: 26,
                        endIndent: 16,
                        color: ColorsManger.blue,
                      ),
                    ),
                    Text(
                      "Or",
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManger.blue),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        indent: 26,
                        endIndent: 16,
                        color: ColorsManger.blue,
                      ),
                    ),
                  ]),
                  SizedBox(height: 24.h),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r)),
                          minimumSize: Size(361.w, 58.h),
                          side: BorderSide(width: 1, color: ColorsManger.blue)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManger.googleLogo,
                            width: 26,
                            height: 26,
                          ),
                          SizedBox(width: 10.w),
                          Text("Login with google",
                              style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsManger.blue)),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (formKey.currentState?.validate() == false) return;
  }

  void _createAccount() {
    Navigator.pushReplacementNamed(context, RoutesManger.register);
  }
}
