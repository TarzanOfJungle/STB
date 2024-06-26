import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/users/models/update_user/put_user.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/models/user_shopping_assignment/user_shopping_assignment.dart';

abstract class UsersRepositoryBase {
  Future<List<User>> getUsers({
    String? searchQuery,
    int? shoppingId,
    bool? friends,
    bool includeSelf = true,
  });

  Future<User> getUserById(int id);

  Future<User> updateUser(PutUser userPut);

  Future<void> assignUserToShopping({
    required int userId,
    required int shoppingId,
  });

  Future<void> unassignUserFromShopping({
    required int userId,
    required int shoppingId,
  });

  Future<void> updateUserNotificationToken({
    required String notificationToken,
  });

  Stream<WebsocketEventWithData<UserShoppingAssignment>>
      getUserShoppingAssignmentChangesStream();
}
