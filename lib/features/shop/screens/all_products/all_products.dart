import 'package:flutter/material.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';
import 'package:tedix/layouts/grid_layout.dart';

import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Popular Products',style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical()),
            ],
          ),

        ),

      ),

    );
  }
}
