import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class Validator {
  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context).enterName;
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context).enter_email;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return AppLocalizations.of(context).valid_email;
    }

    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context).enter_password;
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])[A-Za-z\d!@#\$%^&*(),.?":{}|<>]{6,}$')
        .hasMatch(value)) {
      return AppLocalizations.of(context).password_rule;
    }

    return null;
  }

  static String? validateRePassword(
      String? value, String? password, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context).enter_re_password;
    }
    if (value != password) {
      return AppLocalizations.of(context).password_mismatch;
    }

    return null;
  }
}
