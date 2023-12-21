import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/widgets/info_item.dart';
import 'package:split_the_bill/shopping_detail/widgets/users_balance_carousel.dart';

import '../../ioc_container.dart';
import '../../shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import '../models/transaction/transaction.dart';

const double _TRANSACTION_TILE_HEIGHT = 80.0;
const String _LOADING_ERROR_MESSAGE = 'Something failed, try again later';

class SummaryPage extends StatelessWidget {
  final ShoppingWithContext shopping;

  SummaryPage({super.key, required this.shopping});

  final _shoppingDetailController = get<ShoppingDetailController>();
  final _shoppingMembersController = get<ShoppingMembersController>();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      label: 'Shopping Summary',
      child: Padding(
          padding: const EdgeInsets.all(STANDARD_PADDING),
          child: FutureBuilder(
            future: _shoppingDetailController.fetchTransactions(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                //TODO page loading
                return const LoadingIndicator();
              } else if (!snapshot.data) {
                // TODO something went wrong
                return const Center(
                  child: Text(_LOADING_ERROR_MESSAGE),
                );
              } else {
                return _buildPage(context);
              }
            },
          )),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UsersBalanceCarousel(shopping: shopping),
        _buildInfoSection(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              var transaction = _shoppingDetailController.transactions[index];
              return _buildTransactionTile(context, transaction);
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: SMALL_PADDING,
            ),
            itemCount: _shoppingDetailController.transactions.length,
          ),
        )
      ],
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: STANDARD_PADDING),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoItem(
            icon: const Icon(CupertinoIcons.money_dollar),
            label: 'Amount spent',
            data: '${shopping.ammountSpent},-',
          ),
          InfoItem(
            icon: const Icon(CupertinoIcons.person_2_fill),
            label: 'Members',
            data: '${shopping.numberOfParticipants}',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTile(BuildContext context, Transaction transaction) {
    return Container(
      height: _TRANSACTION_TILE_HEIGHT,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNameDisplay(transaction.payingUserId),
          _buildTransactionAmountDisplay(transaction.ammount),
          _buildNameDisplay(transaction.payedUserId),
        ],
      ),
    );
  }

  Widget _buildNameDisplay(int userId) {
    return FutureBuilder(
      future: _shoppingMembersController.userById(userId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Id: $userId, ERROR');
        } else if (!snapshot.hasData) {
          return const LoadingIndicator();
        } else {
          if (snapshot.data == null) {
            return Text('Id: $userId, ERROR');
          }
          return Text(snapshot.data!.username);
        }
      },
    );
  }

  Widget _buildTransactionAmountDisplay(double amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${amount.toStringAsFixed(amount.truncateToDouble() == amount ? 0 : 1)},-',
        ),
        const Icon(CupertinoIcons.arrow_right), //TODO long arrow
      ],
    );
  }
}
