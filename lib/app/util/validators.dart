import 'package:chomoi/app/config/constant/app_strings.dart';

class Validators {
  static const vietNamPhonePattern = '(84|0[3|5|7|8|9])+([0-9]{8})\\b';
  static const emailPattern =
      r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,20}';

  static String? emailOrUsername(String? input) {
    if (input == null || input.isEmpty) {
      return 'Email or username is required.';
    }
    return null;
  }

  static String? password(String? input) {
    if (input != null && input.isNotEmpty) {
      if (input.length < 6) {
        return AppStrings.input_password_lenght_error_text;
      }
    }
    return null;
  }

  static String? phoneNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      final vietNamPhoneRegex = RegExp(vietNamPhonePattern);
      if (!vietNamPhoneRegex.hasMatch(phoneNumber)) {
        return AppStrings.input_phone_invalid_error_text;
      }
    }
    return null;
  }

  static String? email(String? email) {
    if (email != null && email.isNotEmpty) {
      final emailRegex = RegExp(emailPattern);
      if (!emailRegex.hasMatch(email)) {
        return AppStrings.input_email_invalid_error_text;
      }
    }
    return null;
  }
}
