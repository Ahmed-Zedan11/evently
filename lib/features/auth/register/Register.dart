import 'package:evently/core/resources/Assets_Manger.dart';
import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/validator.dart';
import 'package:evently/core/routes_manger/routes_manger.dart';
import 'package:evently/core/widgets/clickable_button.dart';
import 'package:evently/core/widgets/clickable_text.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securedPassword = true;
  bool securedRePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Register")),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          margin: REdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(AssetsManger.eventlyLogo,
                    height: 186.h, width: 136.w),
                SizedBox(height: 24.h),
                CustomTextField(
                    controller: _nameController,
                    validator: Validator.validateName,
                    prefixIconType: Icons.person_2_rounded,
                    labelText: "Name"),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  prefixIconType: Icons.email_rounded,
                  labelText: "Email",
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
                CustomTextField(
                  controller: _rePasswordController,
                  validator: (input) => Validator.validateRePassword(
                      input, _passwordController.text),
                  isSecure: securedRePassword,
                  prefixIconType: Icons.lock,
                  labelText: "Re Password",
                  suffixIconType: IconButton(
                      onPressed: () {
                        securedRePassword = !securedRePassword;
                        setState(() {});
                      },
                      icon: Icon(securedRePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded)),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                ClickableButton(
                  text: "Create Account",
                  onClick: _createAccount,
                  color: ColorsManger.blue,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(width: 8.w),
                    ClickableText(
                        title: "Login",
                        onClick: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesManger.login);
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() {
    if (formKey.currentState?.validate() == false) return;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }
}
