import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/common/widget/texts/brand_title_text.dart';
import 'package:tedix/common/widget/texts/product_title_text.dart';
import 'package:tedix/features/shop/screens/product_details/product_details.dart';
import 'package:tedix/utils/constants/image_string.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../containers/rounded_container.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_price_text.dart';


class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProductDetailScreen()));},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: TColors.light,
              child: Stack(
                children: [
                 const TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems/2),

            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(title: 'Iphone 16 Pro Max', smallsize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
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
                  padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                  child: TProductPriceText(price: '1299.9'),
                ),

                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: TColors.white)),
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

