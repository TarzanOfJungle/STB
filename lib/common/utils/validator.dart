abstract class Validator {
  static const MIN_PASSWORD_LENGTH = 3;

  static bool validateEmail(String email) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  static bool validatePassword(String password) {
    return password.length >= MIN_PASSWORD_LENGTH;
  }
}
