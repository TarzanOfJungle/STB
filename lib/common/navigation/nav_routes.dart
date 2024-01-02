enum NavRoute {
  // First level routes (equivalent to tabs in bottom nav bar + login and registration)
  login("/login"),
  registration("/registration"),
  home("/home"),
  shoppingList("/shoppings"),
  friends("/friends"),

  // Nested routes
  shoppingDetail("shopping-detail"),
  purchaseDetail("purchase-detail"),
  memberPurchases("member-purchases"),
  shoppingSummary("shopping-summary"),
  shoppingMembers("shopping-members"),
  searchUsers("users-search");

  final String path;
  const NavRoute(this.path);
}
