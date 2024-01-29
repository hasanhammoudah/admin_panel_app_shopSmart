import 'package:flutter/material.dart';

class AppConstants {
  static const String imageUrl =
      'https://cdn.britannica.com/77/170477-050-1C747EE3/Laptop-computer.jpg';

  static List<String> bannersImage = [
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner2.png'
  ];

  static List<String> categoriesList = [
    'Phones',
    'Laptops',
    'Electronics',
    'Watches',
    'Clothes',
    'Shoes',
    'Books',
    'Cosmetics',
    'Accessories'
  ];
  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItem =
        List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
      (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(categoriesList[index]),
      ),
    );
    return menuItem;
  }
}
