import 'package:flutter/material.dart';
import 'package:tedix/features/shop/screens/category/categories.dart';
import '../../../../../common/widget/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_string.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(image: TImages.foodIcon,title: 'FOOD', onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const SubCategoriesScreen()));});
        },
      ),
    );
  }
}
