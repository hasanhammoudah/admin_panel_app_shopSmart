import 'package:admin_panel/providers/product_provider.dart';
import 'package:admin_panel/providers/theme_provider.dart';
import 'package:admin_panel/screens/dashboard_screen.dart';
import 'package:admin_panel/screens/inner_screen/edit_upload_product_form.dart';
import 'package:admin_panel/screens/inner_screen/orders_screen.dart';
import 'package:admin_panel/screens/search_screen.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:admin_panel/utils/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(
          options: const FirebaseOptions(
            storageBucket: FireBaseConst.storageBucket,
            apiKey: FireBaseConst
                .apiKey, //Replace with API key from google-services.json
            appId: FireBaseConst
                .appId, // Replace with App ID from google-services.json`enter code here`
            messagingSenderId: FireBaseConst
                .messagingSenderId, // Replace with Messaging Sender ID from google-services.json
            projectId: FireBaseConst.projectId,
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ProductProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ShopSmart admin panel',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const DashBoardScreen(),
                routes: {
                  SearchScreen.routeName: (context) => const SearchScreen(),
                  OrdersScreenFree.routeName: (context) =>
                      const OrdersScreenFree(),
                  EditOrUploadProductScreen.routeName: (context) =>
                      const EditOrUploadProductScreen(),
                },
              );
            }),
          );
        });
  }
}
