import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';

abstract class TrasactionsRepositoryBase {
  Future<List<Transaction>> getTransactionsOfShopping({required int shoppingId});
}