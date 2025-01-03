import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/common/widget/texts/brand_title_text.dart';
import 'package:tedix/common/widget/texts/product_title_text.dart';
import 'package:tedix/features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/enums.dart';
import '../../../styles/shadows.dart';
import '../../containers/rounded_container.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_price_text.dart';

class TProductCardVertical extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  // Constructor with named parameters
  const TProductCardVertical({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: imageUrl, applyImageRadius: true), // Image URL dynamic
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: title, smallsize: true), // Title dynamic
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TBrandTitleText(title: 'Apple', brandTextSize: TextSizes.medium),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TProductPriceText(price: price.toString()), // Price dynamic
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const SizedBox(
                    width: 38,
                    height: 38,
                    child: Center(child: Icon(Iconsax.add, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}