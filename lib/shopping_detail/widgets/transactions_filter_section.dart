import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_transactions_display_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class TransactionsFilterSection extends StatelessWidget {
  TransactionsFilterSection({super.key});

  final _shoppingMembersController = get<ShoppingMembersController>();
  final _transactionsController = get<UserTransactionsDisplayController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SMALL_PADDING),
      child: StreamBuilderWithHandling(
        stream: Rx.combineLatest2(
          _shoppingMembersController.shoppingMembersStream,
          _transactionsController.selectedUserStream.map((user) => user?.id),
          (members, selectedUserId) => (
            members: members,
            selectedUserId: selectedUserId,
          ),
        ),
        buildWhenData: (context, data) {
          final shoppingMembers = data.members;
          final selectedUserId = data.selectedUserId;
          User? initialUser;
          if (selectedUserId != null) {
            initialUser = shoppingMembers
                .where((member) => member.id == selectedUserId)
                .firstOrNull;
          }

          return DropdownMenu<User?>(
            label: const Text("User"),
            leadingIcon: const Icon(Icons.search),
            initialSelection: initialUser,
            dropdownMenuEntries: _buildUserDropdownEntries(shoppingMembers),
            onSelected: (User? user) =>
                _transactionsController.selectUser(user),
          );
        },
      ),
    );
  }

  List<DropdownMenuEntry<User?>> _buildUserDropdownEntries(List<User> users) {
    return [
      const DropdownMenuEntry<User?>(
        value: null,
        leadingIcon: Icon(CupertinoIcons.person_2_fill),
        label: 'All members',
      ),
      ...users
          .map((e) => DropdownMenuEntry<User?>(value: e, label: e.username))
          .toList()
    ];
  }
}
