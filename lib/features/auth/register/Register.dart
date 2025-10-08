import 'package:evently/core/UI-utills/UI_utills.dart';
import 'package:evently/core/resources/Assets_Manger.dart';
import 'package:evently/core/resources/Colors_Manger.dart';
import 'package:evently/core/resources/validator.dart';
import 'package:evently/core/routes_manger/routes_manger.dart';
import 'package:evently/core/widgets/clickable_button.dart';
import 'package:evently/core/widgets/clickable_text.dart';
import 'package:evently/core/widgets/custom_text_field.dart';
import 'package:evently/core/widgets/flutter_toaste.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        title: Center(child: Text(AppLocalizations.of(context).register)),
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
                    labelText: AppLocalizations.of(context).name),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  prefixIconType: Icons.email_rounded,
                  labelText: AppLocalizations.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  isSecure: securedPassword,
                  prefixIconType: Icons.lock,
                  labelText: AppLocalizations.of(context).password,
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
                  labelText: AppLocalizations.of(context).re_password,
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
                  text: AppLocalizations.of(context).create_account,
                  onClick: _createAccount,
                  color: ColorsManger.blue,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).already_have_account,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(width: 8.w),
                    ClickableText(
                        title: AppLocalizations.of(context).login,
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

  void _createAccount() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      UiUtills.showLoading(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      UiUtills.stopLoading(context);
      CustomFlutterToast.flutterToast(
          message: "u registered successfully", color: Colors.green);
      Navigator.pushReplacementNamed(context, RoutesManger.login);
    } on FirebaseAuthException catch (exception) {
      UiUtills.stopLoading(context);
      CustomFlutterToast.flutterToast(
          message: exception.code, color: ColorsManger.red);
    } catch (exception) {
      UiUtills.stopLoading(context);
      CustomFlutterToast.flutterToast(
          message: "Error while registering", color: ColorsManger.red);
    }
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
