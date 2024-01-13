import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_transactions_display_controller.dart';
import 'package:split_the_bill/shopping_detail/models/transaction_with_users.dart';
import 'package:split_the_bill/shopping_detail/widgets/info_item.dart';
import 'package:split_the_bill/shopping_detail/widgets/transactions_filter_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/users_balance_carousel.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const double _TRANSACTION_TILE_HEIGHT = 70.0;

class SummaryPage extends StatefulWidget {
  final ShoppingWithContext shopping;
  const SummaryPage({super.key, required this.shopping});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final _userTransactionsDisplayController =
      get<UserTransactionsDisplayController>();

  @override
  void dispose() {
    _userTransactionsDisplayController.selectUser(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      label: 'Shopping Summary',
      child: Padding(
        padding: const EdgeInsets.all(STANDARD_PADDING),
        child: StreamBuilderWithHandling(
          stream: _userTransactionsDisplayController
              .filteredTransactionsWithUsersStream,
          buildWhenData: (context, transactions) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UsersBalanceCarousel(),
                _buildInfoSection(),
                TransactionsFilterSection(),
                Expanded(
                  child: _buildTransactionsList(transactions),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTransactionsList(List<TransactionWithUsers> transactions) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        var transaction = transactions[index];
        return _buildTransactionTile(context, transaction);
      },
      separatorBuilder: (_, index) => const SizedBox(height: SMALL_PADDING),
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
            data: '${widget.shopping.ammountSpent},-',
          ),
          InfoItem(
            icon: const Icon(CupertinoIcons.person_2_fill),
            label: 'Members',
            data: '${widget.shopping.numberOfParticipants}',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTile(
      BuildContext context, TransactionWithUsers transaction) {
    return Container(
      height: _TRANSACTION_TILE_HEIGHT,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: _buildNameDisplay(transaction.payingUser)),
          Expanded(child: _buildTransactionAmountDisplay(transaction.ammount)),
          Expanded(flex: 2, child: _buildNameDisplay(transaction.payedUser)),
        ],
      ),
    );
  }

  Widget _buildNameDisplay(User? user) {
    return Text(
      user?.username ?? "Unknown user",
      textAlign: TextAlign.center,
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
        const Icon(CupertinoIcons.arrow_right),
      ],
    );
  }
}
