import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_the_bill/auth/screens/login_page.dart';
import 'package:split_the_bill/auth/screens/registration_page.dart';
import 'package:split_the_bill/common/navigation/nav_routes.dart';
import 'package:split_the_bill/common/widgets/wrappers/bottom_nav_bar_wrapper.dart';
import 'package:split_the_bill/home/screens/home_page.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/screens/purchase_page.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/screens/shopping_members_page.dart';
import 'package:split_the_bill/shopping_detail/widgets/shopping_detail_tabview_wrapper.dart';
import 'package:split_the_bill/shoppings_list/screens/shoppings_list_page.dart';

class NavRouter {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  late final SinglePurchaseController _singlePurchaseController;
  late final ShoppingDetailController _shoppingDetailController;

  RouterConfig<Object> get router => _router;

  NavRouter({
    required SinglePurchaseController singlePurchaseController,
    required ShoppingDetailController shoppingDetailController,
  }) {
    _singlePurchaseController = singlePurchaseController;
    _shoppingDetailController = shoppingDetailController;
  }

  late final _router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: NavRoute.login.path,
    routes: [
      GoRoute(
        path: NavRoute.login.path,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: NavRoute.registration.path,
        builder: (context, state) => const RegistrationPage(),
      ),
      // Stack of bottom navigation bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomNavBarWrapper(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavRoute.home.path,
                builder: (context, state) => HomePage(),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: NavRoute.shoppingList.path,
                  builder: (context, state) => ShoppingsListPage(),
                  routes: [
                    GoRoute(
                      path: NavRoute.shoppingDetail.path,
                      builder: (context, state) =>
                          const ShoppingDetailTabviewWrapper(),
                      routes: [
                        GoRoute(
                          path: NavRoute.purchaseDetail.path,
                          builder: (context, state) => PurchasePage(),
                        ),
                        GoRoute(
                          path: NavRoute.shoppingMembers.path,
                          builder: (context, state) =>
                              const ShoppingMembersPage(),
                        ),
                      ],
                    )
                  ])
            ],
          ),
        ],
      ),
    ],
  );

  void returnBack() {
    _router.pop();
  }

  void toLogin() {
    _router.go(NavRoute.login.path);
  }

  void toRegistration() {
    _router.go(NavRoute.registration.path);
  }

  void toHome() {
    _router.go(NavRoute.home.path);
  }

  void toShoppingList() {
    _router.go(NavRoute.shoppingList.path);
  }

  void toShoppingDetail(int shoppingId) {
    _shoppingDetailController.putShopping(shoppingId);
    final fullPath =
        "${NavRoute.shoppingList.path}/${NavRoute.shoppingDetail.path}";
    _router.go(fullPath);
  }

  void toPurchaseDetail({
    required int shoppingId,
    required ProductShoppingAssignment existingAssignment,
    ProductPurchase? existingPurchases,
  }) {
    _singlePurchaseController.setPurchase(
      shoppingId: shoppingId,
      existingAssignment: existingAssignment,
      existingPurchases: existingPurchases,
    );
    final fullPath =
        "${NavRoute.shoppingList.path}/${NavRoute.shoppingDetail.path}/${NavRoute.purchaseDetail.path}";
    _router.go(fullPath);
  }

  void toShoppingMembers() {
    final fullPath =
        "${NavRoute.shoppingList.path}/${NavRoute.shoppingDetail.path}/${NavRoute.shoppingMembers.path}";
    _router.go(fullPath);
  }
}
