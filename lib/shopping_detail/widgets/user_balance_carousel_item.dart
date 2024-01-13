import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_transactions_display_controller.dart';
import 'package:split_the_bill/shopping_detail/models/transaction_with_users.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class UserBalanceCarouselItem extends StatelessWidget {
  final List<TransactionWithUsers> filteredTransactions;
  final User user;

  UserBalanceCarouselItem({
    super.key,
    required this.filteredTransactions,
    required this.user,
  });

  final _purchasesController = get<PurchasesController>();
  final _transactionsController = get<UserTransactionsDisplayController>();

  List<TransactionWithUsers> get _allTransactions =>
      _transactionsController.allTransactionsWithUsers;

  double get _userBalance => _getUserBalance(user);

  Color get _userbalanceColor =>
      _userBalance < 0 ? UiConstants.deleteColor : UiConstants.confirmColor;

  @override
  Widget build(BuildContext context) {
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
                  _getAmmountTruncated(_userBalance),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: _userbalanceColor),
                ),
                const SizedBox(
                  height: STANDARD_PADDING,
                ),
                Text(
                  'Total amount spent: ${_getAmmountTruncated(
                    _getUserTotalAmount(),
                  )},-',
                ),
              ],
            )));
  }

  double _getUserBalance(User user) {
    return _allTransactions.fold(0.0, (previousValue, transaction) {
      if (transaction.payedUser?.id == user.id) {
        return previousValue + transaction.ammount;
      }
      if (transaction.payingUser?.id == user.id) {
        return previousValue - transaction.ammount;
      }
      return previousValue;
    });
  }

  double _getUserTotalAmount() {
    var userPurchases = _purchasesController.usersWithPurchases
        .where((element) => element.user.id == user.id)
        .firstOrNull;
    return userPurchases?.totalAmmount ?? 0;
  }

  String _getAmmountTruncated(double ammount) {
    return "${ammount.toStringAsFixed(ammount.truncateToDouble() == ammount ? 0 : 2)},-";
  }
}
