import 'package:admin_panel/models/product_model.dart';
import 'package:admin_panel/providers/product_provider.dart';
import 'package:admin_panel/screens/widgets/app_bar_widget.dart';
import 'package:admin_panel/screens/widgets/product_widget.dart';
import 'package:admin_panel/screens/widgets/title_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const routeName = "/SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  List<ProductModel> productListSearch = [];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;

    List<ProductModel> productList = passedCategory == null
        ? productProvider.products
        : productProvider.findByCategory(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarWidget(
          imagePath: "assets/images/bag/shopping_cart.png",
          child: TitlesTextWidget(
            label: passedCategory ?? 'Search products',
            fontWeight: FontWeight.bold,
          ),
        ),
        body: StreamBuilder<List<ProductModel>>(
            stream: productProvider.fetchProductStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: SelectableText(snapshot.error.toString()),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: SelectableText('No products has been added'),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            searchController.clear();
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchController.text,
                              passedList: productList);
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (searchController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                          child: TitlesTextWidget(
                        label: 'No product found',
                      )),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          builder: (context, index) {
                            //
                            //  return ChangeNotifierProvider.value(
                            //   value: productProvider.getProducts[index],
                            //   child: const ProductWidget(),
                            // );

                            // another way
                            return ProductWidget(
                              productId: searchController.text.isNotEmpty
                                  ? productListSearch[index].productId
                                  : productList[index].productId,
                            );
                          },
                          itemCount: searchController.text.isNotEmpty
                              ? productListSearch.length
                              : productList.length,
                          crossAxisCount: 2),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
