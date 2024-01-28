import 'package:admin_panel/providers/product_provider.dart';
import 'package:admin_panel/screens/widgets/subtitle_text.dart';
import 'package:admin_panel/screens/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProductId(widget.productId);

    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () async {},
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: getCurrentProduct.productImage,
                    height: size.height * 0.22,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: TitlesTextWidget(
                        label: getCurrentProduct.productTitle,
                        maxLines: 2,
                        fontSize: 18,
                      ),
                    ),
                    // Flexible(
                    //   flex: 2,
                    //   child: HeartButtonWidget(
                    //     productId: getCurrentProduct.productId,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitleTextWidget(
                        label: 'r${getCurrentProduct.productPrice}',
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.lightBlue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          splashColor: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          );
  }
}
