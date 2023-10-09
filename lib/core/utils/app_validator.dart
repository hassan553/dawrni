class AppValidator {
  // Validates a phone number
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) return "Empty try to add data";
    if (!(RegExp(r'^\+?[0-9]{6,}$').hasMatch(value))) {
      return "Invalid Phone";
    }
    return null; // Return null if the value is valid
  }

  // Validates a name
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return "Empty try to add data";
    if ((value.length < 5)) return "Invalid Length";
    return null; // Return null if the value is valid
  }

  // Validates a password
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Empty try to add data";
    if ((value.length < 6)) return "Invalid Length";
    return null; // Return null if the value is valid
  }
}