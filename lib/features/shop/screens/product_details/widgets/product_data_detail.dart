import 'package:flutter/material.dart';
import 'package:tedix/common/widget/texts/brand_title_text.dart';
import 'package:tedix/common/widget/texts/product_price_text.dart';
import 'package:tedix/utils/constants/enums.dart';
import 'package:tedix/models/products.dart';
import '../../../../../common/widget/containers/rounded_container.dart';
import '../../../../../common/widget/texts/product_title_text.dart';
import '../../../../../models/products_service.dart';


class TProductDataDetail extends StatelessWidget {
  final String productId;

  const TProductDataDetail({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: ProductService().getProductById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {

          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {

          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {

          return Center(child: Text('No product data found'));
        }


        final product = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: 24,
                    backgroundColor: Colors.black12,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text('Price', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                  ),
                ),
                TProductPriceText(price: product.price.toString()),
              ],
            ),
            const SizedBox(height: 24),
            TProductTitleText(title: product.title),
            const SizedBox(height: 24),
            Row(
              children: [
                TBrandTitleText(title: product.brand, brandTextSize: TextSizes.medium),
              ],
            )
          ],
        );
      },
    );
  }
}
