import 'package:rxdart/rxdart.dart';

import '../../users/models/user/user.dart';

class UserTransactionsDisplayController {
  final BehaviorSubject<User?> _selectedUser = BehaviorSubject.seeded(null);

  Stream<User?> get selectedUsersStream => _selectedUser.stream;
  UserTransactionsDisplayController();

  void selectUser(User? user) {
    _selectedUser.add(user);
  }
}
