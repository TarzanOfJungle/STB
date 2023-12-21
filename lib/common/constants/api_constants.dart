abstract class ApiConstants {
  static const Duration timeout = Duration(seconds: 5);
  static const String httpProtocol = "http";
  static const String webSocketProtocol = "ws";
  static const String host = "vps-d123f020.vps.ovh.net";
  static const String versionPathPrefix = "api/v1";
  static const String websocketAuthenticationQueryKey = "access_token";
  static const String websocketInitialHandshake =
      '{"protocol":"json","version":1}';

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

  // Transactions

  static const String paymentEvaluation = "$shoppingsList/payment-evaluation";

  // Products
  static const String products = "$versionPathPrefix/products";

  // Group chat messages
  static const String shoppingMessages = "$versionPathPrefix/shopping-messages";

  // Users
  static const String users = "$versionPathPrefix/users";
  static const String userToShoppingAssignment = "$versionPathPrefix/user-shopping-assignments";
  static const String updateUserNotificationToken = "$versionPathPrefix/users";

  // Socket paths
  static const String shoppingMessagesStream =
      "$versionPathPrefix/live-group-chat";
  static const String productAssignmentChangesStream =
      "$versionPathPrefix/live-product-assignments";
  static const String purchaseChangesStream =
      "$versionPathPrefix/live-purchases";
  static const String shoppingChangesStream =
      "$versionPathPrefix/live-shoppings";
  static const String userShoppingAssignmentChangesStream =
      "$versionPathPrefix/live-users-shoppings";
}
