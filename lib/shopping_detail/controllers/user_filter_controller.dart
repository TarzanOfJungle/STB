import 'package:rxdart/rxdart.dart';

import '../../users/models/user/user.dart';
import '../models/filter_payment_direction_option.dart';

class UserFilterController {

  final BehaviorSubject<User?> _selectedUser = BehaviorSubject.seeded(null);
  final BehaviorSubject<FilterPaymentDirectionOption> _paymentDirection = BehaviorSubject.seeded(FilterPaymentDirectionOption.both);

  Stream<User?> get selectedUsersStream => _selectedUser.stream;
  Stream<FilterPaymentDirectionOption> get paymentDirectionStream => _paymentDirection.stream;

  UserFilterController();

  void selectUser(User? user) {
    _selectedUser.add(user);
  }

  void selectPaymentDirection(FilterPaymentDirectionOption option) {
    if (_selectedUser.value != null) {
      _paymentDirection.add(option);
    }
  }
}
