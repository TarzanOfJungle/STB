import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_transactions_display_controller.dart';
import '../../ioc_container.dart';
import '../../users/models/user/user.dart';

class TransactionsFilterSection extends StatefulWidget {
  TransactionsFilterSection({super.key});

  final _shoppingMembersController = get<ShoppingMembersController>();
  final _userFilterController = get<UserTransactionsDisplayController>();

  @override
  State<TransactionsFilterSection> createState() =>
      _TransactionsFilterSectionState();
}

class _TransactionsFilterSectionState extends State<TransactionsFilterSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SMALL_PADDING),
      child: StreamBuilderWithHandling(
        stream: widget._shoppingMembersController.shoppingMembersStream,
        buildWhenData: (context, data) {
          return _buildFilterFields(data);
        },
      ),
    );
  }

  Widget _buildFilterFields(List<User> users) {
    return DropdownMenu<User?>(
      label: const Text("User"),
      leadingIcon: const Icon(Icons.search),
      initialSelection: null,
      dropdownMenuEntries: _buildUserDropdownEntries(users),
      onSelected: (User? user) => widget._userFilterController.selectUser(user),
    );
  }

  List<DropdownMenuEntry<User?>> _buildUserDropdownEntries(List<User> users) {
    final entries = users
        .map((user) => DropdownMenuEntry<User?>(value: user, label: user.username))
        .toList();
    entries.add(const DropdownMenuEntry<User?>(
      value: null,
      label: 'all',
    ));
    return entries;
  }
}
