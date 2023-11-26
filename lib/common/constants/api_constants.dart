abstract class ApiConstants {
  static const Duration timeout = Duration(seconds: 5);
  static const String httpProtocol = "http";
  static const String webSocketProtocol = "ws";
  static const String host = "vps-d123f020.vps.ovh.net";
  static const String versionPathPrefix = "api/v1";
  static const String websocketAuthenticationQueryKey = "access_token";
  static const String websocketInitialHandshake = '{"protocol":"json","version":1}';

  // Auth
  static const String login = "$versionPathPrefix/auth/login";
  static const String registration = "$versionPathPrefix/auth/registration";
  static const String tokenValidation =
      "$versionPathPrefix/auth/token-validation";

  // Shopping assignments
  static const String productShoppingAssignments =
      "$versionPathPrefix/product-shopping-assignments";

  // Purchases
  static const String purchases = "$versionPathPrefix/purchases";
  static const String productPurchases = "$purchases/product-purchases";

  static const String userPurchases = "$purchases/user-purchases";

  // Shoppings list
  static const String shoppingsList = "$versionPathPrefix/shoppings";

  // Group chat messages
  static const String shoppingMessages = "$versionPathPrefix/shopping-messages";
  static const String shoppingMessagesStream = "$versionPathPrefix/live-group-chat";
}
