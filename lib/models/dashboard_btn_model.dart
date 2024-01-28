import 'package:admin_panel/screens/inner_screen/orders_screen.dart';
import 'package:admin_panel/screens/search_screen.dart';
import 'package:flutter/material.dart';

class DashBoardButtonModel {
  final String text, imagePath;
  final Function onPressed;

  DashBoardButtonModel(
      {required this.text, required this.imagePath, required this.onPressed});

  static List<DashBoardButtonModel> dashboardBtnList(context) => [
        DashBoardButtonModel(
            text: 'Add a new product',
            imagePath: 'assets/images/bag/order.png',
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            }),
        DashBoardButtonModel(
            text: 'inspect all products',
            imagePath: 'assets/images/bag/order.png',
            onPressed: () {
              Navigator.pushNamed(context, OrdersScreenFree.routeName);
            }),
        DashBoardButtonModel(
            text: 'View Orders',
            imagePath: 'assets/images/bag/order.png',
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            }),
      ];
}
