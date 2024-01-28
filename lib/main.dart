import 'package:admin_panel/providers/product_provider.dart';
import 'package:admin_panel/providers/theme_provider.dart';
import 'package:admin_panel/screens/dashboard_screen.dart';
import 'package:admin_panel/screens/search_screen.dart';
import 'package:admin_panel/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ShopSmart admin panel',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const DashBoardScreen(),
          routes: {
            SearchScreen.routeName: (context) => const SearchScreen(),
          },
        );
      }),
    );
  }
}
