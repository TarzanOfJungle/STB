abstract class ApiConstants {
  static const String protocol = "http";
  static const String host = "split-the-bill.somee.com";
  static const String versionPathPrefix = "api/v1";

  static const String login = "$versionPathPrefix/auth/login";
  static const String registration = "$versionPathPrefix/auth/registration";
  static const String tokenValidation = "$versionPathPrefix/auth/token-validation";
}