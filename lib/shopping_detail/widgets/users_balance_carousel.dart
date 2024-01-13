import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/constants/ui_constants.dart';
import '../../ioc_container.dart';
import '../../purchases/controllers/purchases_controller.dart';
import '../../purchases/models/user_purchases/user_purchases.dart';
import '../../users/models/user/user.dart';
import '../controllers/shopping_detail_controller.dart';
import '../controllers/shopping_members_controller.dart';

const double _CAROUSEL_HEIGHT = 200.0;
const double _USER_BALANCE_LARGE_FONT_MULTIPLICATOR = 1.6;

class UsersBalanceCarousel extends StatelessWidget {
  final ShoppingWithContext shopping;

  UsersBalanceCarousel({super.key, required this.shopping});

  final _shoppingDetailController = get<ShoppingDetailController>();
  final _shoppingMembersController = get<ShoppingMembersController>();
  final _purchasesController = get<PurchasesController>();
  final _authController = get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _CAROUSEL_HEIGHT,
          child: StreamBuilderWithHandling(
              stream: _shoppingMembersController.shoppingMembersStream,
              buildWhenData: (context, data) {
                final users = data;
                final currentUserId = _authController.loggedInUser!.id;
                return Swiper(
                  index: users.indexWhere((e) => e.id == currentUserId),
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return _buildCarouselItem(
                      context,
                      itemIndex % shopping.numberOfParticipants,
                      users[itemIndex],
                    );
                  },
                  itemCount: shopping.numberOfParticipants,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex, User user) {
    final transactions = _shoppingDetailController.transactions;
    final amount = transactions.fold(
        0.0,
        (previousValue, e) => e.payedUserId == user.id
            ? (previousValue + e.ammount)
            : (e.payingUserId == user.id
                ? (previousValue - e.ammount)
                : previousValue));
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                  Radius.circular(STANDARD_BORDER_RADIUS)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.username,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: SMALL_PADDING,
                ),
                Text(
                  '${amount.toStringAsFixed(amount.truncateToDouble() == amount ? 0 : 2)},-',
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.titleLarge!.fontSize! *
                            _USER_BALANCE_LARGE_FONT_MULTIPLICATOR,
                    color: amount < 0
                        ? UiConstants.deleteColor
                        : UiConstants.confirmColor,
                  ),
                ),
                const SizedBox(
                  height: STANDARD_PADDING,
                ),
                Text(
                  'Total amount spent: ${_userTotalAmount(user)},-',
                ),
              ],
            )));
  }

  double _userTotalAmount(User user) {
    final userPurchases = _purchasesController.usersWithPurchases.firstWhere(
        (e) => e.user.id == user.id,
        orElse: () => UserPurchases(user: user, productPurchases: []));
    return userPurchases.productPurchases.fold(0.0,
        (previousValue, element) => previousValue + element.totalAmountSpent);
  }
}
