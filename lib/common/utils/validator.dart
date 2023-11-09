abstract class Validator {
  static const MIN_PASSWORD_LENGTH = 6;
  static const MIN_USERNAME_LENGTH = 2;

  static String? validateEmail(String? email) {
    final toValidate = email ?? "";
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid =  regex.hasMatch(toValidate);
    return isValid ? null : "Invalid e-mail";
  }

  static String? validatePassword(String? password) {
    final toValidate = password ?? "";
    final isValid = toValidate.length >= MIN_PASSWORD_LENGTH;
    return isValid
        ? null
        : "Password must be at least $MIN_PASSWORD_LENGTH characters long";
  }

  static String? validateUsername(String? username) {
    final toValidate = username ?? "";
    final isValid = toValidate.length >= MIN_USERNAME_LENGTH;
    return isValid ? null : "Username must be at least $MIN_USERNAME_LENGTH characters long";
  }
}
