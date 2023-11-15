import 'package:flutter/material.dart';
import 'package:split_the_bill/shoppings_list/screens/shoppings_list_page.dart';

import '../models/navbar_item.dart';

abstract class NavbarOptions {
  static const List<NavbarItem> navbarOptions = [
    NavbarItem(
      label: 'MainPage',
      icon: Icon(Icons.home),
      child: Center(child: Text('Main Page TBD')), //TODO
    ),
    NavbarItem(
      label: 'Shoppings List',
      icon: Icon(Icons.shopping_cart),
      child: ShoppingsListPage(),
    ),
    NavbarItem( //TODO
      label: 'Another',
      icon: Icon(Icons.add),
      child: Center(child: Text('Products page TBD')),
    ),
    NavbarItem( //TODO
      label: 'Another 2',
      icon: Icon(Icons.add),
      child: Center(child: Text('Another page TBD')),
    ),
  ];
}