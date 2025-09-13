class Validator {
  final String _emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final String _passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])[A-Za-z\d!@#\$%^&*(),.?":{}|<>]{6,}$';

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please, enter your name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please, enter your e-mail";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Please enter a valid e-mail";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please, enter your Password";
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])[A-Za-z\d!@#\$%^&*(),.?":{}|<>]{6,}$')
        .hasMatch(value)) {
      return "Password must be at least 6 characters, include an uppercase letter and a lowercase letter";
    }

    return null;
  }

  static String? validateRePassword(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return "Please, enter your Re-Password";
    }
    if (value != password) {
      return "Password doesn't match";
    }

    return null;
  }
}
