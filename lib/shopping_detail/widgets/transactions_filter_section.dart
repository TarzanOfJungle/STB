import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_transactions_display_controller.dart';
import '../../ioc_container.dart';
import '../../users/models/user/user.dart';

const double _USER_FILTER_MENU_WIDTH = 220.0;

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
      child: StreamBuilder(
        stream: widget._shoppingMembersController.shoppingMembersStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: LoadingIndicator(),
            );
          } else {
            return _buildFilterFields(snapshot.data!);
          }
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
    List<DropdownMenuEntry<User?>> entries = users
        .map((e) => DropdownMenuEntry<User?>(value: e, label: e.username))
        .toList();

    entries.add(const DropdownMenuEntry<User?>(
      value: null,
      label: 'all',
    ));

    return entries;
  }
}
