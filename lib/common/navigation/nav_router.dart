import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/screens/login_page.dart';
import 'package:split_the_bill/auth/screens/registration_page.dart';
import 'package:split_the_bill/common/navigation/nav_routes.dart';
import 'package:split_the_bill/common/widgets/wrappers/bottom_nav_bar_wrapper.dart';
import 'package:split_the_bill/home/screens/home_page.dart';
import 'package:split_the_bill/profile/screens/profile_page.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';
import 'package:split_the_bill/purchases/screens/purchase_page.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/screens/member_purchases_page.dart';
import 'package:split_the_bill/shopping_detail/screens/shopping_members_page.dart';
import 'package:split_the_bill/shopping_detail/screens/summary_page.dart';
import 'package:split_the_bill/shopping_detail/widgets/shopping_detail_tabview_wrapper.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/screens/shoppings_list_page.dart';
import 'package:split_the_bill/user_chat/controllers/user_chat_controller.dart';
import 'package:split_the_bill/user_chat/screens/user_chat_page.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/screens/search_users_page.dart';
import 'package:split_the_bill/users/widgets/friends_page_tabview_wrapper.dart';

class NavRouter {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final AuthController _authController;
  final SinglePurchaseController _singlePurchaseController;
  final ShoppingDetailController _shoppingDetailController;
  final UserChatController _userChatController;

  RouterConfig<Object> get router => _router;

  NavRouter(
    this._authController,
    this._singlePurchaseController,
    this._shoppingDetailController,
    this._userChatController,
  );

  NavRoute get _initialLocation =>
      _authController.loggedInUser == null ? NavRoute.login : NavRoute.home;

  late final _router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: _initialLocation.path,
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
                  routes: [
                    GoRoute(
                      path: NavRoute.profile.path,
                      builder: (context, state) => ProfilePage(),
                    )
                  ])
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
                            path: NavRoute.memberPurchases.path,
                            builder: (context, state) => MemberPurchasesPage(
                                userPurchases: state.extra as UserPurchases)),
                        GoRoute(
                            path: NavRoute.shoppingSummary.path,
                            builder: (context, state) => SummaryPage(
                                  shopping: state.extra as ShoppingWithContext,
                                )),
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
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: NavRoute.friends.path,
                  builder: (context, state) =>
                      const FriendsPageTabviewWrapper(),
                  routes: [
                    GoRoute(
                      path: NavRoute.searchUsers.path,
                      builder: (context, state) => const SearchUsersPage(),
                    ),
                    GoRoute(
                      path: NavRoute.userChat.path,
                      builder: (context, state) => const UserChatPage(),
                    ),
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

  void toProfile() {
    _router.go("${NavRoute.home.path}/${NavRoute.profile.path}");
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

  void toMemberPurchases(
      {required BuildContext context, required UserPurchases userPurchases}) {
    final fullPath =
        "${NavRoute.shoppingList.path}/${NavRoute.shoppingDetail.path}/${NavRoute.memberPurchases.path}";
    _router.go(fullPath, extra: userPurchases);
  }

  void toShoppingSummary(ShoppingWithContext shoppingWithContext) {
    final fullPath =
        "${NavRoute.shoppingList.path}/${NavRoute.shoppingDetail.path}/${NavRoute.shoppingSummary.path}";
    _router.go(fullPath, extra: shoppingWithContext);
  }

  void toShoppingMembers() {
    final fullPath =
        "${NavRoute.shoppingList.path}/${NavRoute.shoppingDetail.path}/${NavRoute.shoppingMembers.path}";
    _router.go(fullPath);
  }

  void toUsersSearch() {
    final fullPath = "${NavRoute.friends.path}/${NavRoute.searchUsers.path}";
    _router.go(fullPath);
  }

  void toUserChatPage(User chatUser) {
    _userChatController.loadChatMessagesWithUser(chatUser);
    final fullPath = "${NavRoute.friends.path}/${NavRoute.userChat.path}";
    _router.go(fullPath);
  }
}
