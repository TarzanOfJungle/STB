import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_transactions_display_controller.dart';
import 'package:split_the_bill/shopping_detail/widgets/user_balance_carousel_item.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const double _CAROUSEL_HEIGHT = 175.0;

class UsersBalanceCarousel extends StatelessWidget {
  UsersBalanceCarousel({super.key});

  final _transactionsController = get<UserTransactionsDisplayController>();
  final _shoppingMembersController = get<ShoppingMembersController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _CAROUSEL_HEIGHT,
          child: StreamBuilderWithHandling(
              stream: Rx.combineLatest3(
                _shoppingMembersController.shoppingMembersStream,
                _transactionsController.filteredTransactionsWithUsersStream,
                _transactionsController.selectedUserStream,
                (members, transactions, selectedUser) => (
                  shoppingMembers: members,
                  transactions: transactions,
                  selectedUser: selectedUser,
                ),
              ),
              buildWhenData: (context, data) {
                final shoppingMembers = data.shoppingMembers;
                final transactions = data.transactions;

                return Swiper(
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return UserBalanceCarouselItem(
                      filteredTransactions: transactions,
                      user: shoppingMembers[itemIndex],
                    );
                  },
                  onIndexChanged: (value) =>
                      _onCarouselItemChanged(shoppingMembers, value),
                  itemCount: shoppingMembers.length,
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

  void _onCarouselItemChanged(List<User> shoppingMembers, int selectedIndex) {
    final matchingMember = shoppingMembers.elementAtOrNull(selectedIndex);
    if (matchingMember != null) {
      _transactionsController.selectUser(matchingMember);
    }
  }
}
