abstract class ApiConstants {
  static const Duration timeout = Duration(seconds: 5);
  static const searchDebounce = Duration(milliseconds: 500);
  static const String httpProtocol = "http";
  static const String webSocketProtocol = "ws";
  static const String host = "vps-d123f020.vps.ovh.net";
  static const String versionPathPrefix = "api/v1";
  static const String websocketAuthenticationQueryKey = "access_token";
  static const String websocketInitialHandshake =
      '{"protocol":"json","version":1}';

  // Auth
  static const String login = "auth/login";
  static const String registration = "auth/registration";
  static const String tokenValidation = "auth/token-validation";

  // Shopping assignments
  static const String productShoppingAssignments =
      "product-shopping-assignments";

  // Purchases
  static const String purchases = "purchases";
  static const String productPurchases = "$purchases/product-purchases";
  static const String userPurchases = "$purchases/user-purchases";

  // Shoppings list
  static const String shoppingsList = "shoppings";

  // Transactions

  static const String paymentEvaluation = "$shoppingsList/payment-evaluation";

  // Products
  static const String products = "products";

  // Group chat messages
  static const String shoppingMessages = "shopping-messages";

  // Users
  static const String users = "users";
  static const String userToShoppingAssignment = "user-shopping-assignments";
  static const String updateUserNotificationToken = "users";

  // Friendship management
  static const String friendshipRequests = "friendship-requests";
  static const String friendships = "friendship-requests/friendships";

  // User chat messages
  static const String userChatMessages = "user-messages";

  // Statistics
  static const String statistics = "statistics";

  // Socket paths
  static const String shoppingMessagesStream = "live-group-chat";
  static const String productAssignmentChangesStream =
      "live-product-assignments";
  static const String purchaseChangesStream = "live-purchases";
  static const String shoppingChangesStream = "live-shoppings";
  static const String userShoppingAssignmentChangesStream =
      "live-users-shoppings";
  static const String friendshipManagementChangesStream =
      "live-friendship-management";
  static const String userChatMessageChangesStream = "live-user-messages";
}
