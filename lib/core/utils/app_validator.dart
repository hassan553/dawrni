import 'package:dawrni/generated/l10n.dart';

class AppValidator {
  final int maxLength;
  final int minLength;
  List<InputValidator> validators;

  AppValidator(
      {required this.validators, this.maxLength = 20, this.minLength = 8});

  String? validate(String? input) {
    String trimmedInput = input!.trim();
    if (validators.contains(InputValidator.requiredField)) {
      if (trimmedInput.isEmpty) {
        return S.current.requiredField;
      }
    } else if (input.isEmpty) {
      return null;
    }

    if (validators.contains(InputValidator.email)) {
      if (!RegExp(r'^[A-Z0-9._%+-]+@[A-Z0-9._]+\.[A-Z]{2,4}$',
          caseSensitive: false)
          .hasMatch(input ?? '')) {
        return S.current.emailIsNotValid;
      }
    }
    if (validators.contains(InputValidator.minLength)) {
      if (trimmedInput.length < minLength) {
        return S.current.mustBeAtLeastMinlength(minLength);
      }
    }
    
    if (validators.contains(InputValidator.mobile)) {
      if (!RegExp(r'0[0-9]{0,14}').hasMatch(input ?? '')) {
        return S.current.mobileIsNotValid;
      }
    }

    if (validators.contains(InputValidator.login_mobile)) {
      if (!RegExp(r'^(09|\+?9639|\+?009639)\d{8}$').hasMatch(input ?? '')) {
        return '${S.current.mobileIsNotValid} 09xxxxxxxx';
      }
    }

    return null;
  }

  static String? validateIntegerDropDown(int? value) {
    if (value == -1) {
      return S.current.requiredField;
    }
    return null;
  }

  static String? validateStringDropDown(String? value) {
    if (value == '-1') {
      return S.current.requiredField;
    }
    return null;
  }
}

enum InputValidator { email, requiredField, minLength, maxLength, mobile,url,positiveValue, login_mobile, login_minlength, noSpaces}
