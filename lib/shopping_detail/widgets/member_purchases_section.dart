import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchase_grid_tile.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class MemberPurchasesSection extends StatelessWidget {
  final ShoppingWithContext shopping;

  const MemberPurchasesSection({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    //TODO mock
    Future<List<int>> fetchRawData() async {
      // Simulate fetching data from a remote server
      await Future.delayed(const Duration(seconds: 1));
      return [1, 2, 3, 4, 5];
    }

    Future<Iterable<int>>? fetchData() async {
      try {
        List<int> dataList = await fetchRawData();
        return dataList.cast<int>();
      } catch (error) {
        return []; // Return null in case of an error
      }
    }

    return Expanded(
      child: FutureBuilder(
          future: fetchData(), //TODO
          builder: (BuildContext context, AsyncSnapshot<Iterable<int>> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(child: Text("Nothing yet"));
            } else {
              final purchasesList = snapshot.data!.toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  crossAxisSpacing: STANDARD_PADDING,
                  mainAxisSpacing: STANDARD_PADDING,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const MemberPurchaseGridTile();
                },
                itemCount: purchasesList.length,
              );
            }
          }),
    );
  }
}
