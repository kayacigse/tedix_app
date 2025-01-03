import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tedix/common/widget/texts/section_heading.dart';
import 'package:tedix/features/shop/screens/home/home.dart';
import 'package:tedix/features/shop/screens/product_details/widgets/product_data_detail.dart'; // İlgili import
import 'package:tedix/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:tedix/utils/constants/enums.dart';

import '../../../../navigation_menu.dart';
import '../succes_screen/succes_screen.dart'; // Diğer importlar

class ProductDetailScreen extends StatelessWidget {
  final String productId;  //

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImage(imageUrl: 'https://example.com/your-product-image.jpg'),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Column(
                children: [
                  TProductDataDetail(productId: productId),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen(title: 'Your Request Has Been Received', onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationMenu(),),);},),),);}, child: Text('Request'),),
                  ),
                  ),
                  TSectionHeading(title: 'Description', showActionButton: false),
                  ReadMoreText(
                    'Titanium design, latest-generation, ceramic shield front, textured matte glass back. The iPhone 16 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.86 inches diagonally (actual viewable area is less).',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'Show Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
