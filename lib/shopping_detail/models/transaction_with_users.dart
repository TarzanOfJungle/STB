import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class TransactionWithUsers {
  final Transaction transaction;
  final User? payingUser;
  final User? payedUser;

  TransactionWithUsers(
    this.transaction,
    this.payingUser,
    this.payedUser,
  );

  double get ammount => transaction.ammount;
}
