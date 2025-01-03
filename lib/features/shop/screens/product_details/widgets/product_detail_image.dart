import 'package:flutter/material.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/curved_edges/curved_edges_widget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';


class TProductImage extends StatelessWidget {
  const TProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.light,
        child: Stack(
          children: [
            ///large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.productImage1),
                  ),
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
            ),
          ],
        ),
      ),
    );
  }
}