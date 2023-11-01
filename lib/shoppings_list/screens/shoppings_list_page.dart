import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/mock_shoppings_repository.dart';
import 'package:split_the_bill/shoppings_list/widgets/shopping_tile.dart';

import '../../ioc_container.dart';

class ShoppingsListPage extends StatelessWidget {
  const ShoppingsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingsRepository = get<MockShoppingsRepository>(); //TODO this is mock

    return PageTemplate(
      label: 'Shoppings',
      child: FutureBuilder<Iterable<ShoppingWithContext>>(
          future: shoppingsRepository.getShoppings(''),
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<ShoppingWithContext>> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {

              final shoppingsList = snapshot.data!.toList();
              return ListView.separated(
                itemBuilder: (_, index) => ShoppingTile(
                  shopping: shoppingsList[index],
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: shoppingsList.length,
              );
            }
          },
        ),
    );
  }
}
