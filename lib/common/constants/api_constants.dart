abstract class ApiConstants {
  static const Duration timeout = Duration(seconds: 5);
  static const String protocol = "http";
  static const String host = "split-the-bill.somee.com";
  static const String versionPathPrefix = "api/v1";

  // Auth
  static const String login = "$versionPathPrefix/auth/login";
  static const String registration = "$versionPathPrefix/auth/registration";
  static const String tokenValidation = "$versionPathPrefix/auth/token-validation";

  // Shopping assignments
  static const String productShoppingAssignments = "$versionPathPrefix/product-shopping-assignments";

  // Purchases
  static const String purchases = "$versionPathPrefix/purchases";
  static const String productPurchases = "$purchases/product-purchases";

  static const String userPurchases = "$purchases/user-purchases";

  // Shoppings list

  static const String shoppingsList = "$versionPathPrefix/shoppings";
}