enum NavRoute {
  // First level routes (equivalent to tabs in bottom nav bar + login and registration)
  login("/login"),
  registration("/registration"),
  home("/home"),
  shoppingList("/shoppings"),
  // Nested routes
  shoppingDetail("shopping-detail");

  final String path;

  const NavRoute(this.path);
}
