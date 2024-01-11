import 'package:rxdart/rxdart.dart';

import '../../users/models/user/user.dart';

class UserTransactionsDisplayController {

  int _tilesToLoadRemaining = 0;
  final BehaviorSubject<User?> _selectedUser = BehaviorSubject.seeded(null);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(true);

  Stream<User?> get selectedUsersStream => _selectedUser.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;
  UserTransactionsDisplayController();

  void selectUser(User? user) {
    _selectedUser.add(user);
  }

  void forceLoading() {
    _isLoading.add(true);
  }
  void initLoading(int numberOfTiles) {
    _tilesToLoadRemaining = numberOfTiles;
  }

  void tileLoaded() {
    _tilesToLoadRemaining -= 1;
    if (_tilesToLoadRemaining == 0) {
      _isLoading.add(false);
    }
  }
}
